/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

import '../core/database/tables/seed/seed_objects/_types.dart';
import '../core/ui/screens/army_builder/army_builder_item_ui.dart';
import '../domain/models/unit/unit.dart';
import '../domain/models/user_army/user_army.dart';

String getRomeNumber(int arabianNumber)
{
    switch (arabianNumber)
    {
        case 1: return 'I';
        case 2: return 'II';
        case 3: return 'III';
        case 4: return 'IV';
        case 5: return 'V';
        case 6: return 'VI';
        case 7: return 'VII';
        case 8: return 'VIII';
        case 9: return 'IX';
        case 10: return 'X';
        default: return '';
    }
}



Map<String, dynamic> getDecodedJsonUserArmyUnit(String jsonData)
{
  if (jsonData.isEmpty) return {};

  final decoded = jsonDecode(jsonData) as Map<String, dynamic>;
  final categoriesJson = decoded['categories'] as Map<String, dynamic>? ?? {};
  return categoriesJson;
}



Set<String> extractUnitIds(Map<String, dynamic> categoriesJson)
{
    final Set<String> unitIds = {};
    for (var roleList in categoriesJson.values)
    {
        if (roleList is List)
        {
            for (var u in roleList)
            {
                final id = u[SaveCategoryCode.unitId.code];
                if (id != null) unitIds.add(id);
            }
        }
    }
    return unitIds;
}


Map<UnitRoleCode, List<ArmyBuilderUnitItemUi>> getAllUserArmyUnitsOptimized(String jsonData,  List<UnitDOM> loadedBaseUnits)
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
        final List<UnitDOM> baseUnits = loadedBaseUnits;
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
                        loadedUnits.add(convertDomainUnitToUnitItemUi(
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

ArmyBuilderUnitItemUi convertDomainUnitToUnitItemUi(
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
