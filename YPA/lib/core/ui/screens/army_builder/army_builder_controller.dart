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
import 'package:ypa/application/enhancement/enhancement_use_case.dart';
import 'package:ypa/core/providers/di/di_providers.dart';
import 'package:ypa/domain/models/army/army.dart';
import 'package:ypa/domain/models/codex/codex.dart';
import 'package:ypa/domain/models/enhancement/enhancement.dart';

import '../../../../application/detachment/detachments_use_cases.dart';
import '../../../../application/unit/unt_use_case.dart';
import '../../../../application/user_army/user_army_use_cases.dart';
import '../../../../domain/models/detachment/detachment.dart';
import '../../../../domain/models/unit/unit.dart';
import '../../../../domain/models/user_army/user_army.dart';
import '../../../database/tables/seed/seed_objects/_types.dart';
import '../../../providers/di/enhancment_provider.dart';
import 'army_builder_item_ui.dart';
import 'army_builder_state.dart';

/// Провайдер контроллера с параметром armyId
final armyBuilderControllerProvider =
    StateNotifierProvider.family<ArmyBuilderController, ArmyBuilderState, String>((ref, armyId)
        {
            final getUserArmyById = ref.watch(getUserArmyByIdUseCaseProvider);
            final getCodexById = ref.watch(getCodexByIdUseCaseProvider);
            final updateName = ref.watch(updateUserArmyNameUseCaseProvider);
            final updateDetachment = ref.watch(updateUserArmyDetachmentUseCaseProvider);
            final updateBattleSize = ref.watch(updateUserArmyBattleSizeUseCaseProvider);
            final updateArmyWarlord = ref.watch(updateUserArmyWarlordUseCaseProvider);
            final getAllDetachmentsByCodexId = ref.watch(getAlldetachmentsByCodexIdUseCaseProvider);
            final getAllEnhancementsByDetachment = ref.watch(getAllEnhancementsByDetachmentUseCaseProvider);
            final updateUserArmyEnhancement = ref.watch(updateUserArmyEnhancementUseCaseProvider);
            final getAllUnitsByCodexId = ref.watch(getAllUnitsByCodexIdUseCaseProvider);
            final getAllUnitsByArmyId = ref.watch(getUnitsByArmyUseCaseProvider);
            final addUnitToUserRoster = ref.watch(addUnitToUserRosterUseCaseProvider);
            final updateUnitInUserRoster = ref.watch(updateUnitParametersFromUserArmyUseCaseProvider);
            final getUnitsByIdsFromDb = ref.watch(getUnitsByIdsFromDbUseCaseProvider);
            final removeLastUnitFromUserRoster = ref.watch(removeLastUnitFromUserRosterUseCaseProvider);

            return ArmyBuilderController(
                getUserArmyById,
                getCodexById,
                updateName,
                updateDetachment,
                updateBattleSize,
                updateArmyWarlord,
                getAllDetachmentsByCodexId,
                getAllEnhancementsByDetachment,
                updateUserArmyEnhancement,
                getAllUnitsByCodexId,
                getAllUnitsByArmyId,
                addUnitToUserRoster,
                updateUnitInUserRoster,
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
    final UpdateUserArmyWarlord _updateArmyWarlord;
    final GetAllDetachmentsByCodexId _getAllDetachmentsByCodexId;
    final GetAllEnhancementsByDetachment _getAllEnhancementByDetachment;
    final UpdateUserArmyEnhancement _updateUserArmyEnhancement;
    final GetAllUnitsByCodexId _getAllUnitsByCodexid;
    final GetUnitsByArmy _getAllUnitsByArmyId;
    final AddUnitToUserRoster _addUnitToUserRoster;
    final UpdateUnitParametersFromUserArmy _updateUnitInUserRoster;
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
        this._updateArmyWarlord,
        this._getAllDetachmentsByCodexId,
        this._getAllEnhancementByDetachment,
        this._updateUserArmyEnhancement,
        this._getAllUnitsByCodexid,
        this._getAllUnitsByArmyId,
        this._addUnitToUserRoster,
        this._updateUnitInUserRoster,
        this._getUnitsByIdsFromDb,
        this._removeLastUnitFromUserRoster,
        this._armyId
    ) : super(const ArmyBuilderState())
    {
        loadArmy();
    }

    @override
    void dispose()
    {
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

        /// 3. Запускаем новый таймер на 500мс
        _nameDebounceTimer = Timer(const Duration(milliseconds: 500), () async
            {
                try
                {
                    /// пытемся сохранить в базу данных
                    await _updateName(id: _armyId, newUserArmyName: newName);
                } catch (e)
                {
                    state = state.copyWith(error: e.toString());
                    loadArmy(); /// В случае ошибки синхронизируем данные с БД
                }
            });
    }

    Future<void> updateDetachmentArmyRoster(String nameDetachment) async
    {
        final selectedDetachment = state.allDetachments.firstWhere(
            (d) => d.name.value == nameDetachment,
            orElse: () => state.allDetachments.first
        );

        /// 1. Сначала загружаем список новых энхансментов для этого детачмента
        final newAllEnhancements = await _loadAllEnhancementByDetachment(selectedDetachment.id);

        /// 2. Очищаем юнитов от старых энхансментов в памяти
        final Map<UnitRoleCode, List<ArmyBuilderUnitItemUi>> clearedUnits = {};
        state.userArmyUnits?.forEach((role, units)
            {
                clearedUnits[role] = units.map((u) => u.copyWith(selectedEnhancementId: '')).toList();
            });

        /// 3. Обновляем стейт: новый детачмент, новые доступные улучшения, но пустой выбор
        state = state.copyWith(
            selectedDetachment: selectedDetachment,
            allEnhancement: newAllEnhancements,
            selectedEnhancement: {}, /// Сбрасываем выбранные
            userArmyUnits: clearedUnits,
            detachmentId: selectedDetachment.id.value
        );

        try
        {
            /// 4. Сохраняем в базу: новый детачмент и ПУСТУЮ карту энхансментов (это зачистит jsonData юнитов)
            await _updateDetachment(id: _armyId, newDetachment: selectedDetachment);
            await _updateUserArmyEnhancement(armyId: _armyId, selectedEnhancement: {});

            updateCurrentPts();
        } catch (e)
        {
            state = state.copyWith(error: e.toString());
            loadArmy();
        }
    }

    Future<void> updateBattleSizeArmyRoster(BattleSizeCode newSize) async
    {
        final newSb = BattleSize.selected(newSize);

        /// просто обновляемстейт для интерфейса
        state = state.copyWith(selectedBattleSize: {newSize: newSb.total});

        try
        {
            /// пытемся сохранить в базу данных
            await _updateBattleSize(id: _armyId, newSize: newSize);
        } catch (e)
        {
            state = state.copyWith(error: e.toString());
            loadArmy();
        }
    }

    Future<void> updateWarlordArmyRoster(String instanceID) async
    {
        if (instanceID == '') return;

        /// просто обновляемстейт для интерфейса
        state = state.copyWith(selectedInstanceIdWarlord: instanceID);

        try
        {
            /// пытемся сохранить в базу данных
            await _updateArmyWarlord(armyId: _armyId, newWarlordInstanceId: instanceID);
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

    Future<void> duplicateUnitToUserArmy(String unitId, ArmyBuilderUnitItemUi unit) async
    {
        if (state.userArmyUnits == null) return;

        try
        {
            final baseUnitItem = state.allUnitsFromDb.firstWhere((u) => u.dbId == unitId);
            final instanceId = const Uuid().v4();
            final role = UnitRoleCode.fromName(baseUnitItem.role)!;
            final newUnit = baseUnitItem.copyWith(
                instanceId: instanceId,
                dbId: unit.dbId,
                name: unit.name,
                role: unit.role,
                repeat: unit.repeat,
                keywords: unit.keywords,
                factionKeywords: unit.factionKeywords,
                unitComposition: unit.unitComposition,
                unitAbility: unit.unitAbility,
                coreAbilities: unit.coreAbilities,
                factionAbilities: unit.factionAbilities,
                leader: unit.leader,
                ledBy: unit.ledBy,
                modelStats: unit.modelStats
            );

            final Map<UnitRoleCode, List<ArmyBuilderUnitItemUi>> updatedUnits = Map.from(state.userArmyUnits!);
            updatedUnits[role] = [...(updatedUnits[role] ?? []), newUnit];

            state = state.copyWith(userArmyUnits: updatedUnits);
            updateCurrentPts();

            await _addUnitToUserRoster(armyId: _armyId, instanceId: instanceId, unitId: unitId);
            await _updateUnitInUserRoster(
                armyId: _armyId,
                instanceId: instanceId,
                role: UnitRoleCode.fromName(unit.role)!,
                category: SaveCategoryCode.composition,
                updateData: newUnit.unitComposition.toSaveUserArmyJson()
            );

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

            if (index != -1)
            {
                final unitToRemove = unitsInRole[index];
                if (state.selectedEnhancement != null && state.selectedEnhancement!.containsKey(unitToRemove.instanceId))
                {
                    final updatedEnhancemets = Map<String, EnhancementDOM>.from(state.selectedEnhancement!);
                    updatedEnhancemets.remove(unitToRemove.instanceId);

                    state = state.copyWith(selectedEnhancement: updatedEnhancemets);

                    await _updateUserArmyEnhancement(
                        armyId: _armyId,
                        selectedEnhancement: updatedEnhancemets
                    );
                }

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

    void updateUnitWargearInState(String instanceUnitId, UnitRoleCode role, Map<String, List<int>> newWargears)
    {
        if (state.userArmyUnits == null) return;

        final unitsInRole = state.userArmyUnits![role] ?? [];
        final index = unitsInRole.indexWhere((u) => u.instanceId == instanceUnitId);

        if (index != -1)
        {
            /// Создаем копию юнита с обновленными индексами варгира
            final updatedUnit = unitsInRole[index].copyWith(
                selectedWargearIndices: newWargears
            );

            final newList = List<ArmyBuilderUnitItemUi>.from(unitsInRole);
            newList[index] = updatedUnit;

            final newUserArmyUnits = Map<UnitRoleCode, List<ArmyBuilderUnitItemUi>>.from(state.userArmyUnits!);
            newUserArmyUnits[role] = newList;

            /// Обновляем стейт и очки
            state = state.copyWith(userArmyUnits: newUserArmyUnits);
            ///updateCurrentPts();
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

        /// Считаем очки за юнитов
        state.userArmyUnits?.values.expand((u) => u).forEach((unit)
            {
                total += unit.unitComposition.totalUnitCost;
            });

        /// ПЛЮС считаем очки за улучшения (Enhancements)
        state.selectedEnhancement?.values.forEach((e)
            {
                total += e.points;
            });

        state = state.copyWith(currentPts: total);
    }

    void selectEnhancement(String unitInstanceId, EnhancementDOM enhancement, bool isSelected) async
    {
        final currentMap = Map<String, EnhancementDOM>.from(state.selectedEnhancement ?? {});

        /// 1. Управляем картой соответствия Юнит -> Enhancement
        currentMap.remove(unitInstanceId);
        /// Если это уникальное улучшение, убираем его у других
        if (isSelected) currentMap.removeWhere((key, value) => value.id == enhancement.id);

        if (isSelected)
        {
            currentMap[unitInstanceId] = enhancement;
        }

        /// 2. Обновляем список юнитов (проходим по всем, чтобы обеспечить уникальность)
        final Map<UnitRoleCode, List<ArmyBuilderUnitItemUi>> updatedUserUnits = Map.from(state.userArmyUnits!);

        for (final role in updatedUserUnits.keys)
        {
            final List<ArmyBuilderUnitItemUi> units = List.from(updatedUserUnits[role]!);
            bool roleUpdated = false;

            for (int i = 0; i < units.length; i++)
            {
                if (units[i].instanceId == unitInstanceId)
                {
                    /// Ставим или удаляем ID у текущего юнита
                    units[i] = units[i].copyWith(selectedEnhancementId: isSelected ? enhancement.id.value : '');
                    roleUpdated = true;
                    await _updateUnitInUserRoster(
                        armyId: _armyId,
                        instanceId: unitInstanceId,
                        role: role,
                        category: SaveCategoryCode.enhancement,
                        updateData: isSelected ? enhancement.id.value : ''
                    );
                }
                else if (isSelected && units[i].selectedEnhancementId == enhancement.id.value)
                {
                    /// Уникальность: снимаем это улучшение с другого юнита, если оно там было
                    units[i] = units[i].copyWith(selectedEnhancementId: '');
                    roleUpdated = true;
                    await _updateUnitInUserRoster(
                        armyId: _armyId,
                        instanceId: units[i].instanceId,
                        role: role,
                        category: SaveCategoryCode.enhancement,
                        updateData: ''
                    );
                }
            }

            if (roleUpdated) updatedUserUnits[role] = units;
        }

        state = state.copyWith(
            selectedEnhancement: currentMap,
            userArmyUnits: updatedUserUnits
        );
        updateCurrentPts();

        try
        {
            await _updateUserArmyEnhancement(
                armyId: _armyId,
                selectedEnhancement: state.selectedEnhancement ?? {}
            );
        } catch (e)
        {
            state = state.copyWith(error: e.toString());
            loadArmy();
        }
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

            /// загрузка Enhancements

            List<EnhancementDOM> allEnhancement = savedDetachment != null
                ? await _loadAllEnhancementByDetachment(DetachmentId.fromString(savedDetachment.id.value)) :
                [];

            /// --- ОПТИМИЗИРОВАННАЯ ЗАГРУЗКА ЮНИТОВ ---
            final Map<UnitRoleCode, List<ArmyBuilderUnitItemUi>> userArmyUnits = await _getAllUserArmyUnitsOptimized(
                userArmy.jsonData
            );

            ///создаём мапу сохранённых enhancement из юнитов
            Map<String, EnhancementDOM> selecetedEnhancementSaved = _buildEnhancementFromSaveData(allEnhancement, userArmyUnits);

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
                selectedCodex: codex,
                selectedDetachment: savedDetachment,
                detachmentId: userArmy.detachmentId,
                allDetachments: allDetachments,
                allEnhancement: allEnhancement,
                selectedEnhancement: selecetedEnhancementSaved,
                selectedBattleSize: battleSizeMap,
                armyId: userArmy.armyId.value,
                userArmyUnits: userArmyUnits,
                allUnitsFromDb: allUnitsFromDb,
                selectedInstanceIdWarlord: userArmy.warlordInstanceId
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
            for (var roleList in categoriesJson.values)
            {
                if (roleList is List)
                {
                    for (var u in roleList)
                    {
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
                    for (var u in entry.value)
                    {
                        final map = u as Map<String, dynamic>;
                        final unitId = map[SaveCategoryCode.unitId.code];
                        final unitDom = baseUnitsMap[unitId];

                        if (unitDom != null)
                        {

                            loadedUnits.add(_convertDomainUnitToUnitItemUi(
                                    unitDom, 
                                    map[SaveCategoryCode.instanceId.code], 
                                    map[SaveCategoryCode.composition.code],
                                    map[SaveCategoryCode.wargearOptions.code],
                                    map[SaveCategoryCode.weaponInfo.code],
                                    map[SaveCategoryCode.characteristics.code],
                                    map[SaveCategoryCode.enhancement.code]
                                ));
                        }
                    }
                    result[roleCode] = loadedUnits;
                }
            }
            return result;
        } catch (e)
        {
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

    ArmyBuilderUnitItemUi _convertDomainUnitToUnitItemUi(
        UnitDOM unit,
        String instanceId,
        Map<String, dynamic>? savedComposition,
        Map<String, dynamic>? savedWargear,
        List<dynamic>? savedWeaponSnapshot,
        Map<String, dynamic>? savedCharacteristics,
        String savedSelectedEnhancementId
    )
    {
        return ArmyBuilderUnitItemUi(
            instanceId: instanceId == '' ? const Uuid().v4() : instanceId,
            dbId: unit.id.value,
            name: unit.name.value,
            role: unit.role.value.name,
            isEpicHero: unit.isEpicHero,
            repeat: unit.repeat,
            keywords: unit.keywords,
            factionKeywords: unit.factionKeywords,
            unitComposition: _buildCompositionFromSaveData(unit.unitComposition, savedComposition),
            unitAbility: unit.unitAbility,
            coreAbilities: unit.coreAbilities,
            factionAbilities: unit.factionAbilities,
            leader: unit.leader,
            ledBy: unit.ledBy,
            modelStats: unit.modelStats,
            selectedWargearIndices: _buildWargearFromSaveData(savedWargear),
            weaponSnapshot: _buildWWeaponInfoFromSaveData(savedWeaponSnapshot),
            characteristics: _buildCharacteristicsFromSaveData(savedCharacteristics),
            selectedEnhancementId: savedSelectedEnhancementId
        );
    }

    Future<List<ArmyBuilderUnitItemUi>> getAllUnitsByCodexId(CodexId codexId) async
    {
        List<UnitDOM> unitDomain = await _getAllUnitsByCodexid(codexId);
        return unitDomain.map((unit) => _convertDomainUnitToUnitItemUi(unit, '', null, null, null, null, '')).toList();
    }

    Future<List<ArmyBuilderUnitItemUi>> getAllUnitsByArmyId(ArmyId armyId) async
    {
        List<UnitDOM> unitDomain = await _getAllUnitsByArmyId(armyId);
        return unitDomain.map((unit) => _convertDomainUnitToUnitItemUi(unit, '', null, null, null, null, '')).toList();
    }

    Future<List<EnhancementDOM>> _loadAllEnhancementByDetachment(DetachmentId? id) async
    {

        List<EnhancementDOM> allEnhancement = id != null ?
            await _getAllEnhancementByDetachment(id) :
            await _getAllEnhancementByDetachment(state.selectedDetachment!.id);

        return allEnhancement;
    }

    /// ==========================================
    ///  Build Info
    /// ==========================================
    UnitCompositionDom _buildCompositionFromSaveData(UnitCompositionDom unitCompositionFromDB, Map<String, dynamic>? saveComposition)
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

    Map<String, List<int>> _buildWargearFromSaveData(Map<String, dynamic>? saveWargear)
    {

        if (saveWargear != null)
        {
            return saveWargear.map((k, v) => MapEntry(k, List<int>.from(v as List)));
        }
        return {};
    }

    List<Map<String, dynamic>> _buildWWeaponInfoFromSaveData(List<dynamic>? savedWeaponInfo)
    {
        if (savedWeaponInfo != null)
        {
            return savedWeaponInfo.map((e) => Map<String, dynamic>.from(e as Map)).toList();
        }
        return [];
    }

    Map<String, CharacteristicsDom> _buildCharacteristicsFromSaveData(Map<String, dynamic>? savedCharacteristicsInfo)
    {
        if (savedCharacteristicsInfo != null)
        {
            if (savedCharacteristicsInfo.isNotEmpty)
            {
                return savedCharacteristicsInfo.map((k, v) => MapEntry(k, CharacteristicsDom.fromJson(v as Map<String, dynamic>)));
            }
        }
        return {};
    }

    Map<String, EnhancementDOM> _buildEnhancementFromSaveData(List<EnhancementDOM> allEnhancement, Map<UnitRoleCode, List<ArmyBuilderUnitItemUi>> units)
    {
        Map<String, EnhancementDOM> res = {};
        if (allEnhancement.isEmpty) return res;

        final allIdEnhancement = allEnhancement.map((e) => e.id.value).toSet();

        for (final unitsInRole in units.values)
        {
            for (final unit in unitsInRole)
            {
                final eId = unit.selectedEnhancementId;

                if (eId.isNotEmpty && allIdEnhancement.contains(eId))
                {
                    res[unit.instanceId] = allEnhancement.firstWhere((e) => e.id.value == eId);
                }
            }
        }
        return res;
    }
}
