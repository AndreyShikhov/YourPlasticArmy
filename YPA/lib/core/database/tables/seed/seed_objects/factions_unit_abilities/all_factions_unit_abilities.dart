/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import '../_types.dart';


List<FactionUnitAbilitySeed> allFactionsUnitAbilities()
{
    return [

        FactionUnitAbilitySeed(
            code: FactionUnitAbilityCodeX(FactionUnitAbilityCode.oathOfMoment).code,
            name: FactionUnitAbilityCodeX(FactionUnitAbilityCode.oathOfMoment).title,
            shortDescription: 'Reserve deployment',
            description: 'During the Declare Battle Formations step, you can set this unit up in Reserves instead of on the battlefield. In the Reinforcements step of one of your Movement phases, you can set this unit up anywhere on the battlefield that is more than 9" horizontally away from all enemy models.'
        )
    ];
}
