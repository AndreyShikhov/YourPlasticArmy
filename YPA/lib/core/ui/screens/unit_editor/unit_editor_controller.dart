/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/ui/screens/unit_editor/unit_editor_item_ui.dart';
import 'package:ypa/core/ui/screens/unit_editor/unit_editor_state.dart';

import '../../../database/tables/seed/seed_objects/_types.dart';
import '../army_builder/army_builder_controller.dart';

final unitEditorControllerProvider = 
    StateNotifierProvider.family<UnitEditorController, UnitEditorState, (String, String, String)>((ref, ids)
        {
            final (armyId, instanceId, roldeCode) = ids;
            return UnitEditorController(ref, instanceId, armyId, roldeCode);

        }
    );

class UnitEditorController extends StateNotifier<UnitEditorState>
{
    final Ref _ref; // ссылка на контроллер Army editor
    final String _instanceUnitId;
    final String _role;
    final String _armyId;

    // Инициализируем super дефолтным состоянием
    UnitEditorController(
        this._ref,
        this._instanceUnitId,
        this._armyId,
        this._role

    ) : super(UnitEditorState(
                isLoading: true,
                unitInstanceId: _instanceUnitId
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
                inctanceId: unit.instanceId,
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
        return UnitRoleCodeX.fromTitle(_role);
    }
}
