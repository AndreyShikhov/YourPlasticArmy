/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/


import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';
import 'package:ypa/core/ui/screens/unit_editor/unit_editor_item_ui.dart';

import '../../../../domain/models/abilities/core_unit_ability/core_unit_ability.dart';
import '../../../../domain/models/abilities/faction_unit_ability/faction_unit_ability.dart';
import '../../../../domain/models/abilities/unit_ability/unit_ability.dart';


class UnitEditorState
{

    final bool isLoading;
    final String unitInstanceId;
    final UnitEditorItemUi? unit;
    final ArmyTypeCode? armyTypeCode;
    final List<UnitAbilityDOM> unitAbilities;
    final List<CoreUnitAbilityDOM> coreAbilities;
    final List<FactionUnitAbilityDOM> factionAbilities;
    final String? error;

    UnitEditorState({
        this.isLoading = false,
        required this.unitInstanceId,
        this.armyTypeCode,
        this.unit,
        this.unitAbilities = const [],
        this.coreAbilities = const [],
        this.factionAbilities = const [],
        this.error
    });

    UnitEditorState copyWith({
        bool? isLoading,
        String? unitInstanceId,
        ArmyTypeCode? armyTypeCode,
        UnitEditorItemUi? unit,
        List<UnitAbilityDOM>? unitAbilities,
        List<CoreUnitAbilityDOM>? coreAbilities,
        List<FactionUnitAbilityDOM>? factionAbilities,
        String? error
    })
    {
        return UnitEditorState(
            isLoading: isLoading ?? this.isLoading,
            unitInstanceId: unitInstanceId ?? this.unitInstanceId,
            armyTypeCode: armyTypeCode ?? this.armyTypeCode,
            unit: unit ?? this.unit,
            unitAbilities: unitAbilities ?? this.unitAbilities,
            coreAbilities: coreAbilities ?? this.coreAbilities,
            factionAbilities: factionAbilities ?? this.factionAbilities,
            error: error ?? this.error
        );
    }
}
