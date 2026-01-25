/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';

List<CoreUnitAbilitySeed> allCoreUnitAbilities()
{
    return [
        CoreUnitAbilitySeed(
            code: CoreUnitAbilityCodeX(CoreUnitAbilityCode.leader).SnakeName,
            name: CoreUnitAbilityCodeX(CoreUnitAbilityCode.leader).title,
            shortDescription: 'Reserve deployment',
            description: 'During the Declare Battle Formations step, you can set this unit up in Reserves instead of on the battlefield. In the Reinforcements step of one of your Movement phases, you can set this unit up anywhere on the battlefield that is more than 9" horizontally away from all enemy models.'
        ),
        CoreUnitAbilitySeed(
            code: CoreUnitAbilityCodeX(CoreUnitAbilityCode.deepStrike).SnakeName,
            name: CoreUnitAbilityCodeX(CoreUnitAbilityCode.deepStrike).title,
            shortDescription: 'Reserve deployment',
            description: 'During the Declare Battle Formations step, you can set this unit up in Reserves instead of on the battlefield. In the Reinforcements step of one of your Movement phases, you can set this unit up anywhere on the battlefield that is more than 9" horizontally away from all enemy models.'
        ),
        CoreUnitAbilitySeed(
            code: CoreUnitAbilityCodeX(CoreUnitAbilityCode.scouts).SnakeName,
            name: CoreUnitAbilityCodeX(CoreUnitAbilityCode.scouts).title,
            shortDescription: 'Reserve deployment',
            description: 'During the Declare Battle Formations step, you can set this unit up in Reserves instead of on the battlefield. In the Reinforcements step of one of your Movement phases, you can set this unit up anywhere on the battlefield that is more than 9" horizontally away from all enemy models.'
        ),
        CoreUnitAbilitySeed(
            code: CoreUnitAbilityCodeX(CoreUnitAbilityCode.infiltrators).SnakeName,
            name: CoreUnitAbilityCodeX(CoreUnitAbilityCode.infiltrators).title,
            shortDescription: 'Reserve deployment',
            description: 'During the Declare Battle Formations step, you can set this unit up in Reserves instead of on the battlefield. In the Reinforcements step of one of your Movement phases, you can set this unit up anywhere on the battlefield that is more than 9" horizontally away from all enemy models.'
        )
    ];
}

