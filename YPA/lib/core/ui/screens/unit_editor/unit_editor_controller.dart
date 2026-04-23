/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/application/army/get_army_by_id.dart';
import 'package:ypa/application/unit_abilities/unit_ability_use_case.dart';
import 'package:ypa/application/weapon_abilities/get_all_weapon_abilities.dart';
import 'package:ypa/core/ui/screens/unit_editor/unit_editor_item_ui.dart';
import 'package:ypa/core/ui/screens/unit_editor/unit_editor_state.dart';
import 'package:ypa/domain/models/army/army.dart';
import 'package:ypa/domain/models/enhancement/enhancement.dart';

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
                modifiedModelCharacteristics: _recalculateModifiedStatsFromUnit(unit),
                weaponInfo: weaponInfo,
                selectedEnhancement: unit.selectedEnhancementId
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

    /// ==========================================
    ///  Tools
    /// ==========================================

    List< ({String modelName, WeaponType weaponType, String weaponName, bool isEquiped, int amount})> _calculateWeaponInfoWithUnitArmyEditor(ArmyBuilderUnitItemUi unit)
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
                                isEquiped: totalAmount > 0,
                                amount: totalAmount
                                ));
                        }
                    }
                }
            });

        return weaponInfo;
    }

    /// ==========================================
    ///  Updates
    /// ==========================================

    void selectEnhancement(EnhancementDOM enhancement, bool isSelected) async
    {
        if (state.unit == null) return;

        final role = getUnitRoleCode()!;
        final String enhancementId = isSelected ? enhancement.id.value : '';

        /// 1. Обновляем локальный стейт редактора (чтобы кнопка сразу изменилась)
        /// Добавь это поле в UnitEditorItemUi!
        state = state.copyWith(unit: state.unit!.copyWith(selectedEnhancement: enhancementId));

        /// 2. Сохраняем в БД в jsonData юнита
        await _updateUnitInUserRoster(
            armyId: _armyId,
            instanceId: _instanceUnitId,
            role: role,
            category: SaveCategoryCode.enhancement,
            updateData: enhancementId
        );

        /// 3. Вызываем метод в главном контроллере, чтобы он обновил карту энхансментов 
        /// всей армии и пересчитал очки (метод, который мы писали ранее)
        _ref.read(armyBuilderControllerProvider(_armyId).notifier)
            .selectEnhancement(_instanceUnitId, enhancement, isSelected);
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

    void toggleWargearCheckbox(String optionId, int index, bool isSelected)
    {
        if (state.unit == null) return;

        final currentIndices = Map<String, List<int>>.from(state.unit!.selectedWargearIndices);
        final optionIndices = List<int>.from(currentIndices[optionId] ?? []);

        if (isSelected)
        {
            if (!optionIndices.contains(index))
            {
                optionIndices.add(index);
            }
        } else
        {
            optionIndices.remove(index);
        }

        currentIndices[optionId] = optionIndices;
        _updateSnapshotAndRecalculate(currentIndices);
    }

    void toggleWargearRadio(String optionId, int? index)
    {
        if (state.unit == null) return;

        final currentIndices = Map<String, List<int>>.from(state.unit!.selectedWargearIndices);
        if (index == null)
        {
            currentIndices[optionId] = []; /// Если null, очищаем (развыделяем)
        } else
        {
            currentIndices[optionId] = [index]; /// Если есть значение, устанавливаем его
        }

        _updateSnapshotAndRecalculate(currentIndices);
    }

    void _updateSnapshotAndRecalculate(Map<String, List<int>> newIndices) async
    {
        if (state.unit == null) return;

        /// 1. Обновляем индексы в стейте
        final updatedUnit = state.unit!.copyWith(selectedWargearIndices: newIndices);

        /// 2. Полный пересчет weaponInfo на основе снапшота
        final recalculatedWeaponInfo = _calculateWeaponInfoFromSnapshot(updatedUnit);

        /// 3. Полный пересчет статов на основе снапшота (с нуля от базы)
        final fullEffectiveStats = _recalculateModifiedStats(updatedUnit);

        /// 4. Поиск отличий для сохранения в БД
        final Map<String, CharacteristicsDom> diffStats = {};
        fullEffectiveStats.forEach((modelName, currentStats)
            {
                final baseStats = updatedUnit.modelStats[modelName]?.characteristics;
                if (baseStats != null && baseStats != currentStats)
                {
                    diffStats[modelName] = currentStats;
                }
            });

        state = state.copyWith(
            unit: updatedUnit.copyWith(
                weaponInfo: recalculatedWeaponInfo,
                modifiedModelCharacteristics: fullEffectiveStats
            )
        );

        final role = UnitRoleCode.fromName(state.unit!.role)!;

        /// 5. Сохранение в БД только если есть отличия в статах
        if (diffStats.isNotEmpty)
        {
            await _updateUnitInUserRoster(
                armyId: _armyId,
                instanceId: _instanceUnitId,
                role: role,
                category: SaveCategoryCode.characteristics,
                updateData: diffStats.map((k, v) => MapEntry(k, v.toJson()))
            );
        }

        /// 6. Сохранение индексов варгира
        await _updateUnitInUserRoster(
            armyId: _armyId,
            instanceId: _instanceUnitId,
            role: role,
            category: SaveCategoryCode.wargearOptions,
            updateData: newIndices
        );

        /// 7. Сохранение weapon info
        final List<Map<String, dynamic>> weaponInfoToSave = recalculatedWeaponInfo.map((w) =>
            {
                'modelName': w.modelName,
                'weaponType': w.weaponType.name,
                'weaponName': w.weaponName,
                'isEquiped': w.isEquiped,
                'amount': w.amount
            }).toList();

        await _updateUnitInUserRoster(
            armyId: _armyId,
            instanceId: _instanceUnitId,
            role: role,
            category: SaveCategoryCode.weaponInfo,
            updateData: weaponInfoToSave
        );

        /// 8. Обновление основного экрана
        _ref.read(armyBuilderControllerProvider(_armyId).notifier)
            .updateUnitWargearInState(_instanceUnitId, role, newIndices);
    }

    List< ({String modelName, WeaponType weaponType, String weaponName, bool isEquiped, int amount})> _calculateWeaponInfoFromSnapshot(UnitEditorItemUi unit)
    {
        final List< ({String modelName, WeaponType weaponType, String weaponName, bool isEquiped, int amount})> weaponInfo = [];

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

    Map<String, CharacteristicsDom> _recalculateModifiedStats(UnitEditorItemUi unit)
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

    void replaceWeapon(String unitModelName, List<String> replace, List<String> replaceable)
    {
    }
    void addWeapon(String unitModelName, List<String> addWeapons, bool isAdd)
    {
    }
}
