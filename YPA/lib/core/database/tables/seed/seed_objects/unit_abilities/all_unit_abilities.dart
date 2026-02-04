/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';

List<UnitAbilitySeed> allUnitAbilities()
{
    return [
        // ==========================================
        //  spacemarine
        // ==========================================

        const UnitAbilitySeed(
            code: 'shock_assault',
            name: 'Shock Assault',
            shortDescription: 're-roll a Wound roll of 1',
            description: 'Shock Assault: Each time a model in this unit targets an enemy unit with a melee attack, re-roll a Wound roll of 1. If that enemy unit is within range of an objective marker, you can re-roll the Wound roll instead.'
        ),
      const UnitAbilitySeed(
            code: 'unyielding_in_the_face_of_the_foe',
            name: 'Unyielding in the Face of the Foe',
            shortDescription: 're-roll a Wound roll of 1',
            description: 'Unyielding in the Face of the Foe: While this unit is within range of an objective marker you control, each time an attack with a Damage characteristic of 1 is allocated to a model in this unit, add 1 to any armour saving throw made against that attack.'
        ),
      const  UnitAbilitySeed(
            code: 'objective_secured',
            name: 'Objective Secured',
            shortDescription: 're-roll a Wound roll of 1',
            description: 'Objective Secured: If you control an objective marker at the end of your Command phase and this unit is within range of that objective marker, that objective marker remains under your control, even if you have no models within range of it, until your opponent controls it at the start or end of any turn.'
        ),
      const  UnitAbilitySeed(
            code: 'target_elimination',
            name: 'Target Elimination',
            shortDescription: 're-roll a Wound roll of 1',
            description: 'Target Elimination: Each time this unit is selected to shoot, it can use this ability. If it does, until the end of the phase, add 2 to the Attacks characteristic of bolt rifles equipped by models in this unit and you can only select one enemy unit as the target of all of this unit’s attacks.'
        )

    ];
}
