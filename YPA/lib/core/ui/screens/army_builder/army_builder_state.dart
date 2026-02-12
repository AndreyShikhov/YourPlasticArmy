/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/cupertino.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';
import 'package:ypa/core/ui/screens/army_builder/army_builder_item_ui.dart';

import '../../../../domain/models/codex/codex.dart';
import '../../../../domain/models/detachment/detachment.dart';
import '../../../../domain/models/faction/faction.dart';

class ArmyBuilderState
{
    final bool isLoading;
    final String? armyId;
    final String userArmyName;
    final Map<BattleSizeCode, int>? battleSize;
    final int? currentPts;
    final FactionId? factionId;
    final CodexDom? codex;
    final DetachmentDOM? detachment;
    final List<DetachmentDOM> allDetachments;
    final Map<UnitRoleCode, List<ArmyBuilderUnitItemUi>>? userArmyUnits; /// уже добавленный в ростер игрока юниты
    final List<ArmyBuilderUnitItemUi> allUnitsFromDb; /// юниты из базы
    final Map<UnitRoleCode, List<ArmyBuilderUnitItemUi>>? temDataUnitsByRoleFromdb; /// отфильтрованные по роли юниты из базы данны
    final String? error;

    const ArmyBuilderState({
        this.isLoading = false,
        this.userArmyName = '',
        this.armyId,
        this.battleSize,
        this.currentPts,
        this.factionId,
        this.codex,
        this.detachment,
        this.allDetachments = const[],
        this.userArmyUnits = const {},
        this.allUnitsFromDb = const[],
        this.temDataUnitsByRoleFromdb = const {},
        this.error
    });

    ArmyBuilderState copyWith({
        bool? isLoading,
        String? userArmyName,
        String? armyId,
        Map<BattleSizeCode, int>? battleSize,
        int? currentPts,
        FactionId? factionId,
        CodexDom? codex,
        DetachmentDOM? detachment,
        List<DetachmentDOM>? allDetachments,
        Map<UnitRoleCode, List<ArmyBuilderUnitItemUi>>? userArmyUnits,
        List<ArmyBuilderUnitItemUi>? allUnitsFromDb,
        Map<UnitRoleCode, List<ArmyBuilderUnitItemUi>>? temDataUnitsByRoleFromdb,
        String? error
    })
    {
        return ArmyBuilderState(
            isLoading: isLoading ?? this.isLoading,
            userArmyName: userArmyName ?? this.userArmyName,
            armyId: armyId ?? this.armyId,
            battleSize: battleSize ?? this.battleSize,
            currentPts: currentPts ?? this.currentPts,
            factionId: factionId ?? this.factionId,
            codex: codex ?? this.codex,
            detachment: detachment ?? this.detachment,
            allDetachments: allDetachments ?? this.allDetachments,
            userArmyUnits: userArmyUnits ?? this.userArmyUnits,
            allUnitsFromDb: allUnitsFromDb ?? this.allUnitsFromDb,
            temDataUnitsByRoleFromdb: temDataUnitsByRoleFromdb ?? this.temDataUnitsByRoleFromdb,
            error: error ?? this.error
        );
    }

    // ==========================================
    // Updates
    // ==========================================

    // ==========================================
    // Getters
    // ==========================================

    List<ArmyBuilderUnitItemUi> getAllUnitsByRoleFromUserArmy(String role)
    {
        // 1. Проверяем на null или пустоту всей карты
        if (userArmyUnits == null || userArmyUnits!.isEmpty)
        {
            debugPrint('Warning: userArmyUnits is null or empty');
            return [];
        }

        // 2. Преобразуем строковый заголовок (например, "Troops") в Enum UnitRoleCode
        final roleCode = UnitRoleCode.fromName(role);

        // Если роль не распознана, возвращаем пустой список
        if (roleCode == null) return [];

        // 3. Возвращаем список юнитов для этой роли из карты (или пустой список, если такой роли в карте нет)
        return userArmyUnits![roleCode] ?? [];
    }

    List<ArmyBuilderUnitItemUi> getAllUnitsByRoleFromDB(String role)
    {
        // 1. Проверяем на null или пустоту
        if (allUnitsFromDb.isEmpty)
        {
            // Вывод ошибки в консоль (поможет при отладке)
            debugPrint('Warning: allUnits is null or empty');
            return [];
        }
        // 2. Фильтруем и возвращаем список
        return allUnitsFromDb.where((unit) => unit.role == role).toList();
    }

    ArmyBuilderUnitItemUi getUnitByIdFromDb(String unitId)
    {
        return allUnitsFromDb.firstWhere((unit) => unit.name == unitId, orElse: () => ArmyBuilderUnitItemUi.empty());
    }

    List<ArmyBuilderUnitItemUi> getallUnitByNameFromUserArmy(String unitName)
    {
        // 1. Проверяем на null
        if (userArmyUnits == null)
        {
            debugPrint('Warning: userArmyUnits is null or empty');
            return [];
        }

        return userArmyUnits!.values
            .expand((units) => units) // Превращаем Map<Key, List> в один общий Iterable
            .where((unit) => unit.name == unitName) // Фильтруем
            .toList();
    }

    int getCurrentCountUnitFromUserArmy(String unitName)
    {
        return getallUnitByNameFromUserArmy(unitName).length;
    }

    int getAmountUnitsFromUserArmy(String role, String unitName) 
    {
        final roleCode = UnitRoleCode.fromName(role);

        // 2. Если роль не валидна или список юнитов пуст — возвращаем 0
        if (roleCode == null || userArmyUnits == null || userArmyUnits!.isEmpty)
        {
            return 0;
        }

        // 3. Получаем список юнитов для этой роли
        final unitsInRole = userArmyUnits![roleCode] ?? [];

        // 4. Считаем количество юнитов с нужным именем
        return unitsInRole.where((unit) => unit.name == unitName).length;
    }

    Future<ArmyBuilderUnitItemUi> getUnitByInstanceIdFromUserArmy(String unitInstanceId, UnitRoleCode role) async
    {
        final findedUnit = userArmyUnits![role]?.firstWhere((u) => u.instanceId == unitInstanceId);

        return ArmyBuilderUnitItemUi(
            instanceId: findedUnit!.instanceId,
            dbId: findedUnit.dbId,
            name: findedUnit.name,
            role: findedUnit.role,
            repeat: findedUnit.repeat,
            keywords: findedUnit.keywords,
            factionKeywords: findedUnit.factionKeywords,
            unitComposition: findedUnit.unitComposition,
            unitAbility: findedUnit.unitAbility,
            coreAbilities: findedUnit.coreAbilities,
            factionAbilities: findedUnit.factionAbilities,
            leader: findedUnit.leader,
            ledBy: findedUnit.ledBy,
            modelStats: findedUnit.modelStats,
            selectedWargearIndices: findedUnit.selectedWargearIndices
        );
    }
}
