/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/application/unit_abilities/get_all_core_unit_abilities.dart';
import 'package:ypa/application/unit_abilities/get_factions_unit_ability_by_code.dart';
import 'package:ypa/application/unit_abilities/get_unit_bility_by_code.dart';
import 'package:ypa/core/providers/di/di_providers.dart';
import 'package:ypa/core/ui/screens/unit_editor/unit_editor_item_ui.dart';
import 'package:ypa/core/ui/screens/unit_editor/unit_editor_state.dart';
import 'package:ypa/domain/models/core_unit_ability/core_unit_ability.dart';
import 'package:ypa/domain/models/faction_unit_ability/faction_unit_ability.dart';
import 'package:ypa/domain/models/unit_ability/unit_ability.dart';

import '../../../database/tables/seed/seed_objects/_types.dart';
import '../army_builder/army_builder_controller.dart';

final unitEditorControllerProvider = 
    StateNotifierProvider.family<UnitEditorController, UnitEditorState, (String, String, String)>((ref, ids)
        {
            final (armyId, instanceId, roldeCode) = ids;
            final getUnitAbilityByCode = ref.watch(getunitAbilityByCodeUseCaseProvider);
            final getAllCoreUnitAbilities = ref.watch(getAllCoreUnitAbilitiesUseCaseProvider);
            final getFactionAbilityByCode = ref.watch(getFactionUnitAbilityByCodeUseCaseProvider);

            return UnitEditorController(
                ref,
                getUnitAbilityByCode,
                getAllCoreUnitAbilities,
                getFactionAbilityByCode,
                instanceId,
                armyId,
                roldeCode
            );

        }
    );

class UnitEditorController extends StateNotifier<UnitEditorState>
{


    final Ref _ref; // ссылка на контроллер Army editor
    final GetUnitAbilityByCode _getUnitAbilityByCode;
    final GetAllCoreUnitAbilities _getAllCoreUnitAbilities;
    final GetFactionsUnitAbilityByCode _getFactionsUnitAbilityByCode;
    final String _instanceUnitId;
    final String _role;
    final String _armyId;

    // Инициализируем super дефолтным состоянием
    UnitEditorController(
        this._ref,
        this._getUnitAbilityByCode,
        this._getAllCoreUnitAbilities,
        this._getFactionsUnitAbilityByCode,
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

    // ==========================================
    // Load unit
    // ==========================================
    Future<void> _init() async
    {

        final armyState = _ref.read(armyBuilderControllerProvider(_armyId));
        // Здесь будет логика загрузки данных юнита из общего стора или БД
        state = state.copyWith(isLoading: true, error: null, unitInstanceId: _instanceUnitId);

        try
        {
            final  unit = await armyState.getUnitByInstanceIdFromUserArmy(_instanceUnitId,  getUnitRoleCode()!);

            state = state.copyWith(isLoading: false,  unit: UnitEditorItemUi(
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
                selectedComposition: unit.selectedComposition
            ));
        }catch (e)
        {
            state = state.copyWith(isLoading: false, error: e.toString());
        }

    }


    // ==========================================
    // Getters
    // ==========================================

    UnitRoleCode? getUnitRoleCode()
    {
        return UnitRoleCodeX.fromName(_role);
    }

    Future<List<UnitAbilityDOM>> getUnitAbility() async
    {
      // 1. Проверяем, что юнит загружен и у него есть способности
      if (state.unit == null || state.unit!.unitAbility.isEmpty)
      {
        return [];
      }

      // 2. Создаем список Future-запросов для всех кодов способностей

      final List<Future<UnitAbilityDOM?>> futures = state.unit!.unitAbility
          .map((abilityCode) => _getUnitAbilityByCode(abilityCode))
          .toList();

      // 3. Дожидаемся завершения всех запросов одновременно
      final List<UnitAbilityDOM?> results = await Future.wait(futures);

      // 4. Фильтруем null (если способность не найдена в базе) и возвращаем чистый список
      return results.whereType<UnitAbilityDOM>().toList();
    }

    Future<List<CoreUnitAbilityDOM>> getCoreUnitAbility() async {

      if (state.unit == null || state.unit!.coreAbilities.isEmpty)
      {
        return [];
      }

      final  coreAbilities = await _getAllCoreUnitAbilities();

      return coreAbilities.where((ability) {
        return state.unit!.coreAbilities.contains(ability.code);
      }).toList();
    }

    Future<List<FactionUnitAbilityDOM>> getFactionUnitAbility()  async{

      // 1. Проверяем, что юнит загружен и у него есть способности
      if (state.unit == null || state.unit!.factionAbilities.isEmpty)
      {
        return [];
      }

      // 2. Создаем список Future-запросов для всех кодов способностей

      final List<Future<FactionUnitAbilityDOM?>> futures = state.unit!.unitAbility
          .map((abilityCode) => _getFactionsUnitAbilityByCode(abilityCode))
          .toList();

      // 3. Дожидаемся завершения всех запросов одновременно
      final List<FactionUnitAbilityDOM?> results = await Future.wait(futures);

      // 4. Фильтруем null (если способность не найдена в базе) и возвращаем чистый список
      return results.whereType<FactionUnitAbilityDOM>().toList();
    }

}
