/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/application/army/get_army_by_id.dart';
import 'package:ypa/application/unit_abilities/get_all_core_unit_abilities.dart';
import 'package:ypa/application/unit_abilities/get_factions_unit_ability_by_code.dart';
import 'package:ypa/application/unit_abilities/get_unit_bility_by_code.dart';
import 'package:ypa/application/weapon_abilities/get_all_weapon_abilities.dart';
import 'package:ypa/core/ui/screens/unit_editor/unit_editor_item_ui.dart';
import 'package:ypa/core/ui/screens/unit_editor/unit_editor_state.dart';
import 'package:ypa/domain/models/army/army.dart';

import '../../../../application/user_army/user_army_use_cases.dart';
import '../../../../domain/models/abilities/core_unit_ability/core_unit_ability.dart';
import '../../../../domain/models/abilities/faction_unit_ability/faction_unit_ability.dart';
import '../../../../domain/models/abilities/unit_ability/unit_ability.dart';
import '../../../../domain/models/abilities/weapon_ability/weapon_ability.dart';
import '../../../../domain/models/unit/unit.dart';
import '../../../../domain/models/user_army/user_army.dart';
import '../../../database/tables/seed/seed_objects/_types.dart';
import '../../../providers/di/army_providers.dart';
import '../../../providers/di/core_unit_abilities_providers.dart';
import '../../../providers/di/faction_unit_abilities_providers.dart';
import '../../../providers/di/unit_abilities_providers.dart';
import '../../../providers/di/user_army_providers.dart';
import '../../../providers/di/weapon_abilities_providers.dart';
import '../army_builder/army_builder_controller.dart';
import '../army_builder/army_builder_item_ui.dart';

final unitEditorControllerProvider = 
    StateNotifierProvider.family<UnitEditorController, UnitEditorState,  (String, String, String)>((ref, ids)
        {
            final (armyId, instanceId, roldeCode) = ids;
            final getUnitAbilityByCode = ref.watch(getunitAbilityByCodeUseCaseProvider);
            final getAllCoreUnitAbilities = ref.watch(getAllCoreUnitAbilitiesUseCaseProvider);
            final getFactionAbilityByCode = ref.watch(getFactionUnitAbilityByCodeUseCaseProvider);
            final getArmyById = ref.watch(getArmyByIdUseCaseProvider);
            final updateUnitInUserRoster = ref.watch(updateUnitParametersFromUserArmyUseCaseProvider);
            final getAllWeaponAbilities = ref.watch(getAllWeaponAbilitiesUseCaseProvider);

            return UnitEditorController(
                ref,
                getUnitAbilityByCode,
                getAllCoreUnitAbilities,
                getFactionAbilityByCode,
                getArmyById,
                updateUnitInUserRoster,
                getAllWeaponAbilities,
                instanceId,
                armyId,
                roldeCode
            );

        }
    );

class UnitEditorController extends StateNotifier<UnitEditorState>
{

    final Ref _ref; /// ссылка на контроллер Army editor
    final GetUnitAbilityByCode _getUnitAbilityByCode;
    final GetAllCoreUnitAbilities _getAllCoreUnitAbilities;
    final GetFactionsUnitAbilityByCode _getFactionsUnitAbilityByCode;
    final GetArmyById _getArmyById;
    final UpdateUnitParametersFromUserArmy _updateUnitInUserRoster;
    final GetAllWeaponAbilities _getAllWeaponAbilities;
    final String _instanceUnitId;
    final String _role;
    final String _armyId;

    /// Инициализируем super дефолтным состоянием
    UnitEditorController(
        this._ref,
        this._getUnitAbilityByCode,
        this._getAllCoreUnitAbilities,
        this._getFactionsUnitAbilityByCode,
        this._getArmyById,
        this._updateUnitInUserRoster,
        this._getAllWeaponAbilities,
        this._instanceUnitId,
        this._armyId,
        this._role

    ) : super(UnitEditorState(
                isLoading: true,
                unitInstanceId: _instanceUnitId,
                error: null,
                unit: null
            ))
    {
        _init();
    }

    /// ==========================================
    /// Load unit
    /// ==========================================
    Future<void> _init() async
    {

        final armyState = _ref.read(armyBuilderControllerProvider(_armyId));
        /// Здесь будет логика загрузки данных юнита из общего стора или БД
        state = state.copyWith(isLoading: true, error: null, unitInstanceId: _instanceUnitId);

        try
        {
            final unit = await armyState.getUnitByInstanceIdFromUserArmy(_instanceUnitId, getUnitRoleCode()!);

            /// 1. Сбор информации об оружии (Кортежи)
            final weaponInfo = _calculateWeaponInfoWithUnitArmyEditor(unit);

            /// 2. Создаем UI модель юнита
            final editorUnit = UnitEditorItemUi(
                instanceId: unit.instanceId,
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
                modelStats: unit.modelStats,
                weaponInfo: weaponInfo
            );

            /// Сначала сохраняем юнита, чтобы функции get... могли его использовать
            state = state.copyWith(unit: editorUnit);

            /// 3. ЗАГРУЖАЕМ ВСЕ СПОСОБНОСТИ ПАРАЛЛЕЛЬНО
            final abilitiesResults = await Future.wait([
                    getUnitAbility(),
                    getCoreUnitAbility(),
                    getFactionUnitAbility(),
                    getWeaponAbilities()
                ]);

            /// 4. Добавляем Арим код
            final ArmyDOM? army = await _getArmyById(ArmyId.fromString(armyState.armyId!));
            if (army != null)
            {
                state = state.copyWith(armyTypeCode: ArmyTypeCode.fromCode(army.code.value));
            }

            /// 5. ОБНОВЛЯЕМ СТЕЙТ ФИНАЛЬНО
            state = state.copyWith(
                unitAbilities: abilitiesResults[0] as List<UnitAbilityDOM>,
                coreAbilities: abilitiesResults[1] as List<CoreUnitAbilityDOM>,
                factionAbilities: abilitiesResults[2] as List<FactionUnitAbilityDOM>,
                weaponAbilities: abilitiesResults[3] as List<WeaponAbilityDOM>,
                isLoading: false
            );
        }catch (e)
        {
            state = state.copyWith(isLoading: false, error: e.toString());
        }

    }

    /// ==========================================
    /// Getters
    /// ==========================================

    UnitRoleCode? getUnitRoleCode()
    {
        return UnitRoleCode.fromName(_role);
    }

    Future<List<UnitAbilityDOM>> getUnitAbility() async
    {
        /// 1. Проверяем, что юнит загружен и у него есть способности
        if (state.unit == null || state.unit!.unitAbility.isEmpty)
        {
            return [];
        }

        /// 2. Создаем список Future-запросов для всех кодов способностей

        final List<Future<UnitAbilityDOM?>> futures = state.unit!.unitAbility
            .map((abilityCode) => _getUnitAbilityByCode(abilityCode))
            .toList();

        /// 3. Дожидаемся завершения всех запросов одновременно
        final List<UnitAbilityDOM?> results = await Future.wait(futures);

        /// 4. Фильтруем null (если способность не найдена в базе) и возвращаем чистый список
        return results.whereType<UnitAbilityDOM>().toList();
    }

    Future<List<CoreUnitAbilityDOM>> getCoreUnitAbility() async
    {

        if (state.unit == null || state.unit!.coreAbilities.isEmpty)
        {
            return [];
        }

        final coreAbilities = await _getAllCoreUnitAbilities();

        return coreAbilities.where((ability)
            {
                return state.unit!.coreAbilities.contains(CoreUnitAbilityCode.fromName(ability.code));
            }).toList();
    }

    Future<List<FactionUnitAbilityDOM>> getFactionUnitAbility() async
    {

        /// 1. Проверяем, что юнит загружен и у него есть способности
        if (state.unit == null || state.unit!.factionAbilities.isEmpty)
        {
            return [];
        }

        /// 2. Создаем список Future-запросов для всех кодов способностей

        final List<Future<FactionUnitAbilityDOM?>> futures = state.unit!.factionAbilities
            .map((abilityCode) => _getFactionsUnitAbilityByCode(abilityCode.code))
            .toList();

        /// 3. Дожидаемся завершения всех запросов одновременно
        final List<FactionUnitAbilityDOM?> results = await Future.wait(futures);

        /// 4. Фильтруем null (если способность не найдена в базе) и возвращаем чистый список
        return results.whereType<FactionUnitAbilityDOM>().toList();
    }

    Future<List<WeaponAbilityDOM>> getWeaponAbilities() async
    {
        if (state.unit == null) return [];

        final Set<WeaponAbilitiesCode> abilityCodes = {};

        for (final modelStats in state.unit!.modelStats.values)
        {
            for (final weapons in modelStats.modelWeapons.weapons.values)
            {
                for (final weapon in weapons)
                {
                    abilityCodes.addAll(weapon.weaponAbilities);
                }
            }
        }

        if (abilityCodes.isEmpty) return [];

        final allAbilities = await _getAllWeaponAbilities();

        return allAbilities.where((ability) =>
            abilityCodes.any((code) => code.code == ability.code)
        ).toList();
    }

    /// ==========================================
    ///  Tools
    /// ==========================================

    List< ({String modelName, WeaponType weaponType, String weaponName, bool isEquiped, int amount})> _calculateWeaponInfoWithUnitArmyEditor(ArmyBuilderUnitItemUi unit)
    {
        final List< ({String modelName, WeaponType weaponType, String weaponName, bool isEquiped, int amount})> weaponInfo = [];

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

    List< ({String modelName, WeaponType weaponType, String weaponName, bool isEquiped, int amount})> _calculateWeaponUnitWithComposition(UnitEditorItemUi unit, UnitCompositionDom composition)

    {
        final List< ({String modelName, WeaponType weaponType, String weaponName, bool isEquiped, int amount})> weaponInfo = [];

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
                                    final totalModelsCount = composition.effectiveComposition.keys.firstOrNull ?? 0;
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

    List< ({String modelName, WeaponType weaponType, String weaponName, bool isEquiped, int amount})> _calculateWeaponUnitWithCompositionAndStats(
        UnitEditorItemUi unit,
        UnitCompositionDom composition,
        Map<String, ModelStatsDom> modelStats)

    {
        final List< ({String modelName, WeaponType weaponType, String weaponName, bool isEquiped, int amount})> weaponInfo = [];

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
                                isEquiped: isEquiped,
                                amount: totalAmount
                                ));
                        }
                    }
                }
            });

        return weaponInfo;
    }

    void updateComposition(UnitCompositionModelDom newComposition) async
    {
        /// 1. Локальное обновление экрана редактора
        final updatedComp = state.unit!.unitComposition.copyWith(selectedComposition: newComposition);
        state = state.copyWith(unit: state.unit!.copyWith(unitComposition: updatedComp, weaponInfo: _calculateWeaponUnitWithComposition(state.unit!, updatedComp)));

        final role = UnitRoleCode.fromName(_role);

        /// 2. Сохранение в БД (через UseCase)
        await _updateUnitInUserRoster(
            armyId: _armyId,
            instanceId: _instanceUnitId,
            role: role!,
            category: SaveCategoryCode.composition,
            updateData: updatedComp.toSaveUserArmyJson()
        );

        ///2.1 обновление PTS юнита в базе
        Map<String, dynamic> newTotalPts = {SaveCategoryCode.points.code: updatedComp.totalUnitCost};
        await _updateUnitInUserRoster(
            armyId: _armyId,
            instanceId: _instanceUnitId,
            role: role,
            category: SaveCategoryCode.points,
            updateData: newTotalPts.values.first
        );
        /// обновить ещё pts они идут отдельным параметром
        /// 3. Оптимизированное обновление основного экрана
        _ref.read(armyBuilderControllerProvider(_armyId).notifier)
            .updateUnitInState(_instanceUnitId, getUnitRoleCode()!, updatedComp);

    }

    void toggleAdditionalModel(String modelName, bool isSelected) async
    {
        if (state.unit == null) return;

        final currentComp = state.unit!.unitComposition;

        /// Создаем новый список моделей, меняя флаг у нужной
        final updatedAdditional = currentComp.additionalModels.map((m)
            {
                if (m.name == modelName)
                {
                    return UnitCompositionModelDom(
                        name: m.name,
                        amount: m.amount,
                        cost: m.cost,
                        isSelected: isSelected
                    );
                }
                return m;
            }).toList();

        final Map<String, ModelStatsDom> updatedModelStats;
        final currentModelStats = state.unit!.modelStats;
        /// Обновляем видимость статов для дополнительной модели, если она есть в статах
        if (currentModelStats.length > 1 && currentModelStats.containsKey(modelName))
        {
            /// Создаем новую карту: копируем старую и перезаписываем одну модель
            updatedModelStats =
            {
                ...currentModelStats,
                modelName: currentModelStats[modelName]!.copyWith(isNeedShow: isSelected)
            };
        } else
        {
            /// Если модель не найдена или статы одни, оставляем как есть
            updatedModelStats = currentModelStats;
        }

        /// 1. Локальное обновление экрана редактора
        /// Обновляем стейт
        state = state.copyWith(
            unit: state.unit!.copyWith(
                unitComposition: UnitCompositionDom(
                    compositions: currentComp.compositions,
                    selectedComposition: currentComp.selectedComposition,
                    additionalModels: updatedAdditional
                ),
                modelStats: updatedModelStats,
                weaponInfo: _calculateWeaponUnitWithCompositionAndStats(state.unit!, currentComp, updatedModelStats)
            )
        );

        final role = UnitRoleCode.fromName(_role);

        /// 2. Сохранение в БД (через UseCase)

        await _updateUnitInUserRoster(
            armyId: _armyId,
            instanceId: _instanceUnitId,
            role: role!,
            category: SaveCategoryCode.composition,
            updateData: state.unit!.unitComposition.toSaveUserArmyJson()
        );

        ///2.1 обновление PTS юнита в базе
        Map<String, dynamic> newTotalPts = {SaveCategoryCode.points.code: state.unit!.unitComposition.totalUnitCost};
        await _updateUnitInUserRoster(
            armyId: _armyId,
            instanceId: _instanceUnitId,
            role: role,
            category: SaveCategoryCode.points,
            updateData: newTotalPts.values.first
        );

        /// 3. Оптимизированное обновление основного экрана
        _ref.read(armyBuilderControllerProvider(_armyId).notifier)
            .updateUnitInState(_instanceUnitId, getUnitRoleCode()!, state.unit!.unitComposition);

    }

    /// ==========================================
    ///  Wargear operations
    /// ==========================================
    void replaceWeapon(String unitModelName, List<String> replace, List<String> replaceable)
    {
        if (state.unit?.weaponInfo == null) return;

        final updatedWeaponInfo = state.unit!.weaponInfo!.map((info)
            {
                if (info.modelName != unitModelName) return info;

                int newAmount = info.amount;
                bool isEquiped = info.isEquiped;

                /// Если это оружие, которое мы ЗАМЕНЯЕМ (убираем)
                if (replace.contains(info.weaponName))
                {
                    newAmount = (newAmount > 0) ? newAmount - 1 : 0;
                    isEquiped = newAmount > 0;
                }

                /// Если это оружие, которое мы ДОБАВЛЯЕМ
                else if (replaceable.contains(info.weaponName))
                {
                    newAmount++;
                    isEquiped = true;
                }

                return (
                modelName: info.modelName,
                weaponType: info.weaponType,
                weaponName: info.weaponName,
                isEquiped: isEquiped,
                amount: newAmount
                );
            }).toList();

        state = state.copyWith(
            unit: state.unit!.copyWith(weaponInfo: updatedWeaponInfo)
        );

        state = state.copyWith(
            unit: state.unit!.copyWith(weaponInfo: updatedWeaponInfo)
        );
    }

    void addWeapon(String unitModelName, List<String> addWeapons, bool isAdd)
    {
        if (state.unit?.weaponInfo == null) return;

        final updatedWeaponInfo = state.unit!.weaponInfo!.map((info)
            {
                if (info.modelName != unitModelName) return info;

                int newAmount = info.amount;
                bool isEquiped = info.isEquiped;

                newAmount = isAdd ? newAmount + 1 : newAmount - 1;
                isEquiped = newAmount > 0;

                return (
                modelName: info.modelName,
                weaponType: info.weaponType,
                weaponName: info.weaponName,
                isEquiped: isEquiped,
                amount: newAmount
                );
            }).toList();

        state = state.copyWith(
            unit: state.unit!.copyWith(weaponInfo: updatedWeaponInfo)
        );

        state = state.copyWith(
            unit: state.unit!.copyWith(weaponInfo: updatedWeaponInfo)
        );
    }
}

