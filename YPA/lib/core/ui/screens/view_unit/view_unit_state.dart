/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../../../../domain/models/abilities/core_unit_ability/core_unit_ability.dart';
import '../../../../domain/models/abilities/faction_unit_ability/faction_unit_ability.dart';
import '../../../../domain/models/abilities/unit_ability/unit_ability.dart';
import '../../../../domain/models/abilities/weapon_ability/weapon_ability.dart';
import '../unit_editor/unit_editor_item_ui.dart';

class ViewUnitState
{
    final bool isLoading;
    final UnitEditorItemUi? unit;
    final List<UnitAbilityDOM> unitAbilities;
    final List<CoreUnitAbilityDOM> coreAbilities;
    final List<FactionUnitAbilityDOM> factionAbilities;
    final List<WeaponAbilityDOM> weaponAbilities;
    final String? error;

    const ViewUnitState({
        this.isLoading = false,
        this.unit,
        this.unitAbilities = const[],
        this.coreAbilities = const[],
        this.factionAbilities = const[],
        this.weaponAbilities = const[],
        this.error
    });

    ViewUnitState copyWith({
        bool? isLoading,
        UnitEditorItemUi? unit,
        List<UnitAbilityDOM>? unitAbilities,
        List<CoreUnitAbilityDOM>? coreAbilities,
        List<FactionUnitAbilityDOM>? factionAbilities,
        List<WeaponAbilityDOM>? weaponAbilities,
        String? error
    })
    {
        return ViewUnitState(
            isLoading: isLoading ?? this.isLoading,
            unit: unit ?? this.unit,
            unitAbilities: unitAbilities ?? this.unitAbilities,
            coreAbilities: coreAbilities ?? this.coreAbilities,
            factionAbilities: factionAbilities ?? this.factionAbilities,
            weaponAbilities: weaponAbilities ?? this.weaponAbilities,
            error: error ?? this.error
        );
    }
}
