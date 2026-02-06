/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:ypa/application/codex/get_codex_by_id.dart';
import 'package:ypa/core/providers/di/di_providers.dart';
import 'package:ypa/domain/models/army/army.dart';
import 'package:ypa/domain/models/codex/codex.dart';

import '../../../../application/detachment/detachments_use_cases.dart';
import '../../../../application/unit/unt_use_case.dart';
import '../../../../application/user_army/user_army_use_cases.dart';
import '../../../../domain/models/detachment/detachment.dart';
import '../../../../domain/models/unit/unit.dart';
import '../../../../domain/models/user_army/user_army.dart';
import '../../../database/tables/seed/seed_objects/_types.dart';
import 'army_builder_item_ui.dart';
import 'army_builder_state.dart';

// Провайдер контроллера с параметром armyId
final armyBuilderControllerProvider =
    StateNotifierProvider.family<ArmyBuilderController, ArmyBuilderState, String>((ref, armyId)
        {
            final getUserArmyById = ref.watch(getUserArmyByIdUseCaseProvider);
            final getCodexById = ref.watch(getCodexByIdUseCaseProvider);
            final updateName = ref.watch(updateUserArmyNameUseCaseProvider);
            final updateDetachment = ref.watch(updateUserArmyDetachmentUseCaseProvider);
            final updateBattleSize = ref.watch(updateUserArmyBattleSizeUseCaseProvider);
            final getAllDetachmentsByCodexId = ref.watch(getAlldetachmentsByCodexIdUseCaseProvider);
            final getAllUnitsByCodexId = ref.watch(getAllUnitsByCodexIdUseCaseProvider);
            final getAllUnitsByArmyId = ref.watch(getUnitsByArmyUseCaseProvider);
            final addUnitToUserRoster = ref.watch(addUnitToUserRosterUseCaseProvider);
            final getUnitsByIdsFromDb = ref.watch(getUnitsByIdsFromDbUseCaseProvider);
            final removeLastUnitFromUserRoster = ref.watch(removeLastUnitFromUserRosterUseCaseProvider);

            return ArmyBuilderController(
                getUserArmyById,
                getCodexById,
                updateName,
                updateDetachment,
                updateBattleSize,
                getAllDetachmentsByCodexId,
                getAllUnitsByCodexId,
                getAllUnitsByArmyId,
                addUnitToUserRoster,
                getUnitsByIdsFromDb,
                removeLastUnitFromUserRoster,
                armyId
            );
        });

class ArmyBuilderController extends StateNotifier<ArmyBuilderState>
{
    final GetUserArmyById _getUserArmyById;
    final GetCodexById _getCodexById;
    final UpdateUserArmyName _updateName;
    final UpdateUserArmyDetachment _updateDetachment;
    final UpdateUserArmyBattleSize _updateBattleSize;
    final GetAllDetachmentsByCodexId _getAllDetachmentsByCodexId;
    final GetAllUnitsByCodexId _getAllUnitsByCodexid;
    final GetUnitsByArmy _getAllUnitsByArmyId;
    final AddUnitToUserRoster _addUnitToUserRoster;
    final RemoveLastUnitFromUserRoster _removeLastUnitFromUserRoster;
    final GetUnitsByIdsFromDb _getUnitsByIdsFromDb;
    final String _armyId;

    Timer? _nameDebounceTimer;

    ArmyBuilderController(
        this._getUserArmyById,
        this._getCodexById,
        this._updateName,
        this._updateDetachment,
        this._updateBattleSize,
        this._getAllDetachmentsByCodexId,
        this._getAllUnitsByCodexid,
        this._getAllUnitsByArmyId,
        this._addUnitToUserRoster,
        this._getUnitsByIdsFromDb,
        this._removeLastUnitFromUserRoster,
        this._armyId
    ) : super(const ArmyBuilderState())
    {
        loadArmy();
    }

    @override
    void dispose() {
        _nameDebounceTimer?.cancel();
        super.dispose();
    }

    /// ==========================================
    /// Updates
    /// ==========================================

    Future<void> updateNameArmyRoster(String newName) async
    {
        /// 1. Обновляем стейт мгновенно для плавности UI
        state = state.copyWith(userArmyName: newName);
        
        /// 2. Сбрасываем старый таймер
        _nameDebounceTimer?.cancel();
        
        // 3. Запускаем новый таймер на 500мс
        _nameDebounceTimer = Timer(const Duration(milliseconds: 500), () async {
            try
            {
                await _updateName(id: _armyId, newUserArmyName: newName);
            } catch (e)
            {
                state = state.copyWith(error: e.toString());
                loadArmy(); // В случае ошибки синхронизируем данные с БД
            }
        });
    }

    Future<void> updateDetachmentArmyRoster(String nameDetachment) async
    {
        if (nameDetachment == '') return;
        final selectedDetachment = state.allDetachments.firstWhere(
            (d) => d.name.value == nameDetachment,
            orElse: () => state.allDetachments.first
        );

        state = state.copyWith(detachment: selectedDetachment);

        try
        {
            await _updateDetachment(id: _armyId, newDetachment: selectedDetachment);
        } catch (e)
        {
            state = state.copyWith(error: e.toString());
            loadArmy();
        }
    }

    Future<void> updateBattleSizeArmyRoster(BattleSizeCode newSize) async
    {
        final newSb = BattleSize.selected(newSize);
        state = state.copyWith(battleSize: {newSize: newSb.total});

        try
        {
            await _updateBattleSize(id: _armyId, newSize: newSize);
        } catch (e)
        {
            state = state.copyWith(error: e.toString());
            loadArmy();
        }
    }

    Future<void> addUnitToUserArmy(String unitId) async
    {
        if (state.userArmyUnits == null) return;

        try
        {
            final baseUnitItem = state.allUnitsFromDb.firstWhere((u) => u.dbId == unitId);
            final instanceId = const Uuid().v4();
            final role = UnitRoleCode.fromName(baseUnitItem.role)!;
            final newUnit = baseUnitItem.copyWith(instanceId: instanceId);

            final Map<UnitRoleCode, List<ArmyBuilderUnitItemUi>> updatedUnits = Map.from(state.userArmyUnits!);
            updatedUnits[role] = [...(updatedUnits[role] ?? []), newUnit];

            state = state.copyWith(userArmyUnits: updatedUnits);
            updateCurrentPts();

            await _addUnitToUserRoster(armyId: _armyId, instanceId: instanceId, unitId: unitId);
        } catch (e)
        {
            state = state.copyWith(error: e.toString());
            loadArmy();
        }
    }

    Future<void> removeLastUnitFromUserArmy(String unitId, UnitRoleCode role) async
    {
        if (state.userArmyUnits == null) return;

        try
        {
            final List<ArmyBuilderUnitItemUi> unitsInRole = List.from(state.userArmyUnits![role] ?? []);
            final index = unitsInRole.lastIndexWhere((u) => u.dbId == unitId);
            
            if (index != -1) {
                unitsInRole.removeAt(index);
                final Map<UnitRoleCode, List<ArmyBuilderUnitItemUi>> updatedUnits = Map.from(state.userArmyUnits!);
                updatedUnits[role] = unitsInRole;

                state = state.copyWith(userArmyUnits: updatedUnits);
                updateCurrentPts();
            }

            await _removeLastUnitFromUserRoster(armyId: _armyId, role: role, unitId: unitId);
        } catch (e)
        {
            state = state.copyWith(error: e.toString());
            loadArmy();
        }
    }

    void updateUnitInState(String instanceId, UnitRoleCode role, UnitCompositionDom newComposition)
    {
        if (state.userArmyUnits == null) return;

        final unitsInRole = state.userArmyUnits![role] ?? [];
        final index = unitsInRole.indexWhere((u) => u.instanceId == instanceId);

        if (index != -1)
        {
            final updatedUnit = unitsInRole[index].copyWith(
                unitComposition: newComposition
            );

            final newList = List<ArmyBuilderUnitItemUi>.from(unitsInRole);
            newList[index] = updatedUnit;

            final newUserArmyUnits = Map<UnitRoleCode, List<ArmyBuilderUnitItemUi>>.from(state.userArmyUnits!);
            newUserArmyUnits[role] = newList;

            state = state.copyWith(userArmyUnits: newUserArmyUnits);
            updateCurrentPts();
        }
    }

    void updateCurrentPts()
    {
        int total = 0;
        if (state.userArmyUnits == null || state.userArmyUnits!.isEmpty)
        {
            state = state.copyWith(currentPts: total);
            return;
        }

        state.userArmyUnits!.forEach((role, units)
            {
                for (var unit in units)
                {
                    total += unit.unitComposition.totalUnitCost;
                }
            });

        state = state.copyWith(currentPts: total);
    }

    /// ==========================================
    ///  Load Army
    /// ==========================================

    Future<void> loadArmy() async
    {
        state = state.copyWith(isLoading: true, error: null, armyId: _armyId);
        try
        {
            final userArmy = await _getUserArmyById(_armyId);

            if (userArmy == null)
            {
                state = state.copyWith(isLoading: false, error: 'Army not found');
                return;
            }

            final codex = await _getCodexById(userArmy.codexId);
            List<DetachmentDOM> allDetachments = [];
            if (codex != null)
            {
                allDetachments = await _getAllDetachmentsByCodexId(userArmy.codexId);
            }

            final savedDetachment = userArmy.detachmentId != null
                ? allDetachments.where((d) => d.id.value == userArmy.detachmentId).firstOrNull
                : null;

            // --- ОПТИМИЗИРОВАННАЯ ЗАГРУЗКА ЮНИТОВ ---
            final Map<UnitRoleCode, List<ArmyBuilderUnitItemUi>> userArmyUnits = await _getAllUserArmyUnitsOptimized(
                userArmy.jsonData
            );

            final List<ArmyBuilderUnitItemUi> allUnitsFromDb = await getAllUnitsByArmyId(userArmy.armyId);
            allUnitsFromDb.addAll(await getAllUnitsByCodexId(userArmy.codexId));

            final sb = userArmy.battleSize;
            final selectedCode = sb?.selected;
            final Map<BattleSizeCode, int> battleSizeMap = (sb != null && selectedCode != null)
                ? {selectedCode: sb.total}
                : {};

            state = state.copyWith(
                isLoading: false,
                userArmyName: userArmy.userArmyName,
                factionId: userArmy.factionId,
                codex: codex,
                detachment: savedDetachment,
                allDetachments: allDetachments,
                battleSize: battleSizeMap,
                armyId: userArmy.armyId.value,
                userArmyUnits: userArmyUnits,
                allUnitsFromDb: allUnitsFromDb
            );

            fillTemDataUnitsByRole();
            updateCurrentPts();
        } catch (e)
        {
            state = state.copyWith(isLoading: false, error: e.toString());
        }
    }

    Future<Map<UnitRoleCode, List<ArmyBuilderUnitItemUi>>> _getAllUserArmyUnitsOptimized(String jsonData) async
    {
        if (jsonData.isEmpty) return {};

        try
        {
            final decoded = jsonDecode(jsonData) as Map<String, dynamic>;
            final categoriesJson = decoded['categories'] as Map<String, dynamic>? ?? {};
            
            /// 1. Собираем все уникальные unitId для пакетного запроса
            final Set<String> allUnitIds = {};
            for (var roleList in categoriesJson.values) {
                if (roleList is List) {
                    for (var u in roleList) {
                        final id = u[SaveCategoryCode.unitId.code];
                        if (id != null) allUnitIds.add(id);
                    }
                }
            }

            /// 2. Пакетная загрузка всех базовых данных юнитов за ОДИН запрос
            final List<UnitDOM> baseUnits = await _getUnitsByIdsFromDb(allUnitIds.toList());
            final Map<String, UnitDOM> baseUnitsMap = {for (var u in baseUnits) u.id.value: u};

            /// 3. Распределяем по ролям и инстансам
            final Map<UnitRoleCode, List<ArmyBuilderUnitItemUi>> result = {};

            for (final entry in categoriesJson.entries)
            {
                final roleCode = UnitRoleCode.fromName(entry.key);
                if (roleCode != null && entry.value is List)
                {
                    final List<ArmyBuilderUnitItemUi> loadedUnits = [];
                    for (var u in entry.value) {
                        final map = u as Map<String, dynamic>;
                        final unitId = map[SaveCategoryCode.unitId.code];
                        final unitDom = baseUnitsMap[unitId];
                        
                        if (unitDom != null) {
                            loadedUnits.add(_convertDomainUnitToUnitItemUi(
                                unitDom, 
                                map[SaveCategoryCode.instanceId.code], 
                                map[SaveCategoryCode.composition.code]
                            ));
                        }
                    }
                    result[roleCode] = loadedUnits;
                }
            }
            return result;
        } catch (e) {
            debugPrint('Optimization error: $e');
            return {};
        }
    }

    void fillTemDataUnitsByRole()
    {
        Map<UnitRoleCode, List<ArmyBuilderUnitItemUi>> temDataUnitsByRole = {};
        for (UnitRoleCode role in UnitRoleCode.values)
        {
            List<ArmyBuilderUnitItemUi> units = state.getAllUnitsByRoleFromDB(role.name);
            if (units.isNotEmpty)
            {
                temDataUnitsByRole.addEntries([MapEntry(role, units)]);
            }
        }
        state = state.copyWith(temDataUnitsByRoleFromdb: temDataUnitsByRole);
    }

    ArmyBuilderUnitItemUi _convertDomainUnitToUnitItemUi(UnitDOM unit, String instanceId, Map<String, dynamic>? saveComposition)
    {
        return ArmyBuilderUnitItemUi(
            instanceId: instanceId == '' ? const Uuid().v4() : instanceId,
            dbId: unit.id.value,
            name: unit.name.value,
            role: unit.role.value.name,
            repeat: unit.repeat,
            keywords: unit.keywords,
            factionKeywords: unit.factionKeywords,
            unitComposition: _buildCompositionFromSavedata(unit.unitComposition, saveComposition),
            unitAbility: unit.unitAbility,
            coreAbilities: unit.coreAbilities,
            factionAbilities: unit.factionAbilities,
            leader: unit.leader,
            ledBy: unit.ledBy,
            modelStats: unit.modelStats
        );
    }

    Future<List<ArmyBuilderUnitItemUi>> getAllUnitsByCodexId(CodexId codexId) async
    {
        List<UnitDOM> unitDomain = await _getAllUnitsByCodexid(codexId);
        return unitDomain.map((unit) => _convertDomainUnitToUnitItemUi(unit, '', null)).toList();
    }

    Future<List<ArmyBuilderUnitItemUi>> getAllUnitsByArmyId(ArmyId armyId) async
    {
        List<UnitDOM> unitDomain = await _getAllUnitsByArmyId(armyId);
        return unitDomain.map((unit) => _convertDomainUnitToUnitItemUi(unit, '', null)).toList();
    }

    UnitCompositionDom _buildCompositionFromSavedata(UnitCompositionDom unitCompositionFromDB, Map<String, dynamic>? saveComposition)
    {
        var tempComposition = unitCompositionFromDB;
        if (saveComposition != null)
        {
            final restoredComposition = UnitCompositionDom.fromJson(saveComposition);
            if (restoredComposition.selectedComposition != null)
            {
                tempComposition = tempComposition.copyWith(
                    selectedComposition: restoredComposition.selectedComposition
                );
            }
            final updatedAdditional = tempComposition.additionalModels.map((baseModel) 
            {
                final bool isSelected = restoredComposition.additionalModels.any((rm) => 
                    rm.name == baseModel.name && 
                    rm.amount == baseModel.amount && 
                    rm.cost == baseModel.cost
                );
                return isSelected ? baseModel.copyWith(isSelected: true) : baseModel;
            }).toList();
            tempComposition = tempComposition.copyWith(additionalModels: updatedAdditional);
        }
        return tempComposition;
    }
}
