/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

import '../core/database/tables/seed/seed_objects/_types.dart';
import '../core/ui/screens/army_builder/army_builder_item_ui.dart';
import '../core/ui/screens/unit_editor/unit_editor_item_ui.dart';
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




/// ==========================================
///  Build Unit Item UI
/// ==========================================

UnitEditorItemUi getItemUiByUnit(ArmyBuilderUnitItemUi unit)  {
  return UnitEditorItemUi(
      instanceId: unit.instanceId,
      name: unit.name,
      role: unit.role,
      isEpicHero: unit.isEpicHero,
      repeat: unit.repeat,
      keywords: unit.keywords,
      factionKeywords: unit.factionKeywords,
      unitComposition: unit.unitComposition,
      unitAbility: unit.unitAbility,
      coreAbilities: unit.coreAbilities,
      factionAbilities: unit.factionAbilities,
      leader: unit.leader,
      ledBy: unit.ledBy,
      modelStats: unit.modelStats,
      selectedWargearIndices: unit.selectedWargearIndices,
      modifiedModelCharacteristics:  _recalculateModifiedStatsFromUnit(unit),
      weaponInfo: _calculateWeaponInfoWithUnitArmyEditor(unit),
      selectedEnhancement: unit.selectedEnhancementId
  );
}

Map<String, CharacteristicsDom> _recalculateModifiedStatsFromUnit(ArmyBuilderUnitItemUi unit)
{
  final Map<String, CharacteristicsDom> modifiedStats = unit.modelStats.map(
          (key, value) => MapEntry(key, value.characteristics)
  );

  unit.selectedWargearIndices.forEach((optionId, selectedIndices)
  {
    final parts = optionId.split('-');
    if (parts.length < 2) return;

    final modelName = parts[0];
    final optionIdx = int.tryParse(parts[1]);

    if (!unit.modelStats.containsKey(modelName)) return;
    final model = unit.modelStats[modelName]!;

    if (optionIdx == null || optionIdx >= model.wargearOptions.length) return;
    final option = model.wargearOptions[optionIdx];

    if (option.changeParameter == null || option.changeParameter!.isEmpty) return;

    for (var idx in selectedIndices)
    {
      if (idx < option.changeParameter!.length)
      {
        final paramChanges = option.changeParameter!.values.elementAt(idx);

        for (var change in paramChanges)
        {
          final statName = change.keys.first;
          final value = change.values.first;

          final current = modifiedStats[modelName]!;
          CharacteristicsDom updated;

          switch (statName)
          {
            case 'movement': updated = current.copyWith(movement: current.movement + value);
            break;
            case 'toughness': updated = current.copyWith(toughness: current.toughness + value);
            break;
            case 'save': updated = current.copyWith(save: current.save + value);
            break;
            case 'invulnerableSave': updated = current.copyWith(invulnerableSave: current.invulnerableSave + value);
            break;
            case 'wounds': updated = current.copyWith(wounds: current.wounds + value);
            break;
            case 'leadership': updated = current.copyWith(leadership: current.leadership + value);
            break;
            case 'objectiveControl': updated = current.copyWith(objectiveControl: current.objectiveControl + value);
            break;
            default: updated = current;
            break;
          }
          modifiedStats[modelName] = updated;
        }
      }
    }
  });

  return modifiedStats;
}

List<({String modelName, WeaponType weaponType, String weaponName, bool isEquiped, int amount})> _calculateWeaponInfoWithUnitArmyEditor(ArmyBuilderUnitItemUi unit)
{
  /// 1. Пытаемся восстановить данные из сохраненного снапшота
  if (unit.weaponSnapshot.isNotEmpty)
  {
    try
    {
      return unit.weaponSnapshot.map((w)
      {
        return (
        modelName: w['modelName'] as String,
        weaponType: WeaponType.values.byName(w['weaponType'] as String),
        weaponName: w['weaponName'] as String,
        isEquiped: w['isEquiped'] as bool,
        amount: w['amount'] as int
        );
      }).toList();
    } catch (e)
    {
      /// Если структура снапшота устарела или повреждена,
      /// логика перейдет к расчету по умолчанию ниже
      debugPrint('Weapon snapshot restore error: $e');
    }
  }

  final List<({String modelName, WeaponType weaponType, String weaponName, bool isEquiped, int amount})> weaponInfo = [];

  /// 1. Считаем общее количество сержантов во всем юните заранее
  int totalSergeantsInUnit = 0;
  unit.modelStats.forEach((_, stats)
  {
    if (stats.isSergeant ?? false) totalSergeantsInUnit++;
  });

  /// 2. Основной цикл по моделям
  unit.modelStats.forEach((modelName, stats)
  {
    if (stats.isNeedShow! || stats.isSergeant!)
    {
      bool isSergeant = stats.isSergeant ?? false;

      for (final type in [WeaponType.ranged, WeaponType.melee])
      {
        final availableWeapons = stats.modelWeapons.weapons[type] ?? [];
        final equippedNames = stats.modelWeapons.selectedWeapons[type] ?? [];

        for (final weapon in availableWeapons)
        {
          int totalAmount = 0;
          bool isEquiped = equippedNames.contains(weapon.name);

          if (isEquiped)
          {
            if (isSergeant)
            {
              totalAmount = 1;
            }
            else
            {
              /// Количество моделей без сержантов
              final totalModelsCount = unit.unitComposition.effectiveComposition.keys.firstOrNull ?? 0;
              totalAmount = totalModelsCount - totalSergeantsInUnit;
            }
          }

          weaponInfo.add((
          modelName: modelName,
          weaponType: type,
          weaponName: weapon.name,
          isEquiped: isEquiped,
          amount: totalAmount
          ));
        }
      }
    }
  });

  return weaponInfo;
}


/// ==========================================
///  Calculate unit wargear
/// ==========================================

List<({String modelName, WeaponType weaponType, String weaponName, bool isEquiped, int amount})> calculateWeaponInfoFromSnapshot(UnitEditorItemUi unit)
{
  final List<({String modelName, WeaponType weaponType, String weaponName, bool isEquiped, int amount})> weaponInfo = [];

  /// Временная карта для подсчета количества экипированного оружия
  /// Map<modelName, Map<weaponName, amount>>
  final Map<String, Map<String, int>> equippedCount = {};

  /// 1. Инициализируем базовое оружие для всех видимых моделей
  int totalSergeants = 0;
  unit.modelStats.forEach((modelName, stats)
  {
    if (stats.isSergeant == true) totalSergeants++;
  });

  int totalModels = unit.unitComposition.effectiveComposition.keys.firstOrNull ?? 0;
  int normalModels = totalModels - totalSergeants;

  unit.modelStats.forEach((modelName, stats)
  {
    if (!(stats.isNeedShow == true || stats.isSergeant == true)) return;

    equippedCount[modelName] ??= {};
    int modelCount = (stats.isSergeant == true) ? 1 : normalModels;

    for (final type in [WeaponType.ranged, WeaponType.melee])
    {
      final baseWeapons = stats.modelWeapons.selectedWeapons[type] ?? [];
      for (var wName in baseWeapons)
      {
        equippedCount[modelName]![wName] = (equippedCount[modelName]![wName] ?? 0) + modelCount;
      }
    }
  });

  /// 2. Применяем изменения из снапшота
  unit.modelStats.forEach((modelName, stats)
  {
    if (!(stats.isNeedShow == true || stats.isSergeant == true)) return;

    for (int i = 0; i < stats.wargearOptions.length; i++)
    {
      final option = stats.wargearOptions[i];
      final optionId = "$modelName-$i";
      final selectedIndices = unit.selectedWargearIndices[optionId] ?? [];

      for (var idx in selectedIndices)
      {
        /// Если это замена
        if (option.replaceWeapons.isNotEmpty)
        {
          final int entryIdx = (option.replaceWeapons.length > 1) ? idx : 0;

          if (entryIdx < option.replaceWeapons.length)
          {
            final replaceEntry = option.replaceWeapons.entries.elementAt(entryIdx);
            final baseWeapons = replaceEntry.key;
            final newWeapons = replaceEntry.value;

            for (var w in baseWeapons)
            {
              equippedCount[modelName]![w] = (equippedCount[modelName]![w] ?? 0) - 1;
            }
            for (var w in newWeapons)
            {
              equippedCount[modelName]![w] = (equippedCount[modelName]![w] ?? 0) + 1;
            }
          }
        }
        /// Если это просто добавление
        else if (option.additionalWeapons.isNotEmpty)
        {
          for (var w in option.additionalWeapons)
          {
            equippedCount[modelName]![w] = (equippedCount[modelName]![w] ?? 0) + 1;
          }
        }
        /// Если это замена оружия на статы
        else if (option.changeParameter != null && option.changeParameter!.isNotEmpty)
        {
          for (var weapons in option.changeParameter!.keys)
          {
            for (String weapon in weapons)
            {
              equippedCount[modelName]![weapon] = (equippedCount[modelName]![weapon] ?? 0) - 1;
            }
          }
        }
      }
    }
  });

  /// 3. Формируем финальный список weaponInfo
  unit.modelStats.forEach((modelName, stats)
  {
    if (!(stats.isNeedShow == true || stats.isSergeant == true)) return;

    final Set<String> allPossibleWeapons = {};
    for (var type in [WeaponType.ranged, WeaponType.melee])
    {
      allPossibleWeapons.addAll(stats.modelWeapons.weapons[type]?.map((w) => w.name) ?? []);
    }

    for (var wName in allPossibleWeapons)
    {
      int amount = equippedCount[modelName]?[wName] ?? 0;
      WeaponType? type;
      if (stats.modelWeapons.weapons[WeaponType.ranged]?.any((w) => w.name == wName) == true) type = WeaponType.ranged;
      else if (stats.modelWeapons.weapons[WeaponType.melee]?.any((w) => w.name == wName) == true) type = WeaponType.melee;

      if (type != null)
      {
        weaponInfo.add((
        modelName: modelName,
        weaponType: type,
        weaponName: wName,
        isEquiped: amount > 0,
        amount: amount
        ));
      }
    }
  });

  return weaponInfo;
}

Map<String, CharacteristicsDom> recalculateModifiedStats(UnitEditorItemUi unit)
{
  /// 1. Начинаем с оригинальных характеристик всех моделей (база)
  final Map<String, CharacteristicsDom> modifiedStats = unit.modelStats.map(
          (key, value) => MapEntry(key, value.characteristics)
  );

  /// 2. Проходим по всем выбранным опциям и применяем их бонусы
  unit.selectedWargearIndices.forEach((optionId, selectedIndices)
  {
    final parts = optionId.split('-');
    if (parts.length < 2) return;

    final modelName = parts[0];
    final optionIdx = int.tryParse(parts[1]);

    if (!unit.modelStats.containsKey(modelName)) return;
    final model = unit.modelStats[modelName]!;

    if (optionIdx == null || optionIdx >= model.wargearOptions.length) return;
    final option = model.wargearOptions[optionIdx];

    if (option.changeParameter == null || option.changeParameter!.isEmpty) return;

    for (var idx in selectedIndices)
    {
      if (idx < option.changeParameter!.length)
      {
        final paramChanges = option.changeParameter!.values.elementAt(idx);

        for (var change in paramChanges)
        {
          final statName = change.keys.first;
          final value = change.values.first;

          final current = modifiedStats[modelName]!;
          CharacteristicsDom updated;

          switch (statName)
          {
            case 'movement': updated = current.copyWith(movement: current.movement + value);
            break;
            case 'toughness': updated = current.copyWith(toughness: current.toughness + value);
            break;
            case 'save': updated = current.copyWith(save: current.save + value);
            break;
            case 'invulnerableSave': updated = current.copyWith(invulnerableSave: current.invulnerableSave + value);
            break;
            case 'wounds': updated = current.copyWith(wounds: current.wounds + value);
            break;
            case 'leadership': updated = current.copyWith(leadership: current.leadership + value);
            break;
            case 'objectiveControl': updated = current.copyWith(objectiveControl: current.objectiveControl + value);
            break;
            default: updated = current;
            break;
          }
          modifiedStats[modelName] = updated;
        }
      }
    }
  });

  return modifiedStats;
}