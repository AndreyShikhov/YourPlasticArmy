/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/ui/screens/view_army/view_army_controller.dart';
import 'package:ypa/core/ui/screens/view_unit/view_unit_state.dart';

import '../../../../application/unit_abilities/unit_ability_use_case.dart';
import '../../../../application/weapon_abilities/get_all_weapon_abilities.dart';
import '../../../../domain/models/abilities/core_unit_ability/core_unit_ability_dom.dart';
import '../../../../domain/models/abilities/faction_unit_ability/faction_unit_ability_dom.dart';
import '../../../../domain/models/abilities/unit_ability/unit_ability_dom.dart';
import '../../../../domain/models/abilities/weapon_ability/weapon_ability_dom.dart';
import '../../../../domain/models/unit/unit_stats.dart';
import '../../../database/tables/seed/seed_objects/_types.dart';
import '../../../providers/di/core_unit_abilities_providers.dart';
import '../../../providers/di/faction_unit_abilities_providers.dart';
import '../../../providers/di/unit_abilities_providers.dart';
import '../../../providers/di/weapon_abilities_providers.dart';
import '../unit_editor/unit_editor_item_ui.dart';

final ViewUnitControllerProvider = StateNotifierProvider.autoDispose.family<ViewUnitController, ViewUnitState, (String, String, String)>((ref, ids)
    {
        final (armyId, instanceId, roleCode) = ids;  
        final getUnitAbilityByCode = ref.watch(getunitAbilityByCodeUseCaseProvider);
        final getAllCoreUnitAbilities = ref.watch(getAllCoreUnitAbilitiesUseCaseProvider);
        final getFactionAbilityByCode = ref.watch(getFactionUnitAbilityByCodeUseCaseProvider);
        final getAllWeaponAbilities = ref.watch(getAllWeaponAbilitiesUseCaseProvider);

        final controller = ViewUnitController(
            ref,
            getAllCoreUnitAbilities,
            getAllWeaponAbilities,
            getFactionAbilityByCode,
            getUnitAbilityByCode,
            instanceId,
            armyId,
            roleCode
        );
        return controller;
    });

class ViewUnitController extends StateNotifier<ViewUnitState>
{
    final Ref _ref;
    final GetUnitAbilityByCode _getUnitAbilityByCode;
    final GetAllCoreUnitAbilities _getAllCoreUnitAbilities;
    final GetFactionsUnitAbilityByCode _getFactionsAbilityByCode;
    final GetAllWeaponAbilities _getAllWeaponAbilities;
    final String _instanceUnitId;
    final String _role;
    final String _armyId;

    ViewUnitController(
        this._ref,
        this._getAllCoreUnitAbilities,
        this._getAllWeaponAbilities,
        this._getFactionsAbilityByCode,
        this._getUnitAbilityByCode,
        this._instanceUnitId,
        this._armyId,
        this._role
    ) : super(
            const ViewUnitState(
                isLoading: true,
                unit: null,
                error: null
            )
        )
    {
        _init();
    }

    Future<void> _init() async
    {
        final viewArmyState = _ref.read(viewArmyControllerProvider(_armyId));
        /// Здесь будет логика загрузки данных юнита из общего стора или БД
        state = state.copyWith(isLoading: true, error: null, unit: null);

        try
        {
            final roleCode = UnitRoleCode.fromTitle(_role);

            final unit = await viewArmyState.getUnitByInstanceIdFromUserArmy(_instanceUnitId, roleCode!);

            final core = await getCoreUnitAbility(unit);
            final abilities = await getUnitAbility(unit);
            final factions = await getFactionUnitAbility(unit);
            final weapons = await getWeaponAbilities(unit);



            final updatedUnit = unit.copyWith(weaponInfo:_calculateWeaponUnitWithCompositionAndStats(unit, unit.unitComposition, unit.modelStats));

            state = state.copyWith(
                isLoading: false,
                unit: updatedUnit,
                coreAbilities: core,
                unitAbilities: abilities,
                factionAbilities: factions,
                weaponAbilities: weapons
            );
        } catch (e)
        {
            state = state.copyWith(
                isLoading: false,
                error: e.toString()
            );
        }
    }

    /// ==========================================
    ///  Load unit abilities
    /// ==========================================

    Future<List<UnitAbilityDOM>> getUnitAbility(UnitEditorItemUi? unit) async
    {
        /// 1. Проверяем, что юнит загружен и у него есть способности
        if (unit == null || unit.unitAbility.isEmpty)
        {
            return [];
        }

        /// 2. Создаем список Future-запросов для всех кодов способностей

        final List<Future<UnitAbilityDOM?>> futures = unit.unitAbility
            .map((abilityCode) => _getUnitAbilityByCode(abilityCode))
            .toList();

        /// 3. Дожидаемся завершения всех запросов одновременно
        final List<UnitAbilityDOM?> results = await Future.wait(futures);

        /// 4. Фильтруем null (если способность не найдена в базе) и возвращаем чистый список
        return results.whereType<UnitAbilityDOM>().toList();
    }

    Future<List<CoreUnitAbilityDOM>> getCoreUnitAbility(UnitEditorItemUi? unit) async
    {
        if (unit == null || unit.coreAbilities.isEmpty)
        {
            return [];
        }

        final coreAbilities = await _getAllCoreUnitAbilities();

        return coreAbilities.where((ability)
            {
                return unit.coreAbilities.contains(CoreUnitAbilityCode.fromName(ability.code));
            }).toList();
    }

    Future<List<FactionUnitAbilityDOM>> getFactionUnitAbility(UnitEditorItemUi? unit) async
    {
        /// 1. Проверяем, что юнит загружен и у него есть способности
        if (unit == null || unit.factionAbilities.isEmpty)
        {
            return [];
        }

        /// 2. Создаем список Future-запросов для всех кодов способностей

        final List<Future<FactionUnitAbilityDOM?>> futures = unit.factionAbilities
            .map((abilityCode) => _getFactionsAbilityByCode(abilityCode.code))
            .toList();

        /// 3. Дожидаемся завершения всех запросов одновременно
        final List<FactionUnitAbilityDOM?> results = await Future.wait(futures);

        /// 4. Фильтруем null (если способность не найдена в базе) и возвращаем чистый список
        return results.whereType<FactionUnitAbilityDOM>().toList();
    }

    Future<List<WeaponAbilityDOM>> getWeaponAbilities(UnitEditorItemUi? unit) async
    {
        if (unit == null) return [];

        final Set<WeaponAbilitiesCode> abilityCodes = {};

        for (final modelStats in unit.modelStats.values)
        {
            for (final weapons in modelStats.modelWeapons.weapons.values)
            {
                for (final weapon in weapons)
                {
                    weapon.weapons.forEach((key, value)
                        {
                            abilityCodes.addAll(value.weaponAbilities);
                        });
                }
            }
        }

        if (abilityCodes.isEmpty) return [];

        final allAbilities = await _getAllWeaponAbilities();

        return allAbilities.where((ability) =>
            abilityCodes.any((code) => code.code == ability.code)
        ).toList();
    }

    List<({String modelName, WeaponType weaponType, String weaponName, bool isEquiped, int amount})> _calculateWeaponUnitWithCompositionAndStats(
        UnitEditorItemUi unit,
        UnitCompositionDom composition,
        Map<String, ModelStatsDom> modelStats)

    {
        final List<({String modelName, WeaponType weaponType, String weaponName, bool isEquiped, int amount})> weaponInfo = [];

        /// 1. Считаем общее количество сержантов во всем юните заранее
        int totalSergeantsInUnit = 0;
        modelStats.forEach((_, stats)
            {
                if (stats.isSergeant ?? false) totalSergeantsInUnit++;
            });

        /// 2. Основной цикл по моделям
        modelStats.forEach((modelName, stats)
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
                                    final totalModelsCount = composition.effectiveComposition.keys.firstOrNull ?? 0;
                                    totalAmount = totalModelsCount - totalSergeantsInUnit;
                                }
                            }

                            weaponInfo.add((
                                modelName: modelName,
                                weaponType: type,
                                weaponName: weapon.name,
                                isEquiped: totalAmount > 0,
                                amount: totalAmount
                            ));
                        }
                    }
                }
            });

        return weaponInfo;
    }
}
