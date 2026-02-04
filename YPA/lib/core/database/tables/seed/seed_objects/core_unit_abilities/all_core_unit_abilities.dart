/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';

List<CoreUnitAbilitySeed> allCoreUnitAbilities()
{
    return [
        CoreUnitAbilitySeed(
            code: CoreUnitAbilityCode.leader.code,
            name: CoreUnitAbilityCode.leader.title,
            shortDescription: 'Reserve deployment',
            description: 'During the Declare Battle Formations step, you can set this unit up in Reserves instead of on the battlefield. In the Reinforcements step of one of your Movement phases, you can set this unit up anywhere on the battlefield that is more than 9" horizontally away from all enemy models.'
        ),
        CoreUnitAbilitySeed(
            code: CoreUnitAbilityCode.deepStrike.code,
            name: CoreUnitAbilityCode.deepStrike.title,
            shortDescription: 'Reserve deployment',
            description: 'During the Declare Battle Formations step, you can set this unit up in Reserves instead of on the battlefield. In the Reinforcements step of one of your Movement phases, you can set this unit up anywhere on the battlefield that is more than 9" horizontally away from all enemy models.'
        ),
        CoreUnitAbilitySeed(
            code: CoreUnitAbilityCode.scouts.code,
            name: CoreUnitAbilityCode.scouts.title,
            shortDescription: 'Reserve deployment',
            description: 'During the Declare Battle Formations step, you can set this unit up in Reserves instead of on the battlefield. In the Reinforcements step of one of your Movement phases, you can set this unit up anywhere on the battlefield that is more than 9" horizontally away from all enemy models.'
        ),
        CoreUnitAbilitySeed(
            code: CoreUnitAbilityCode.infiltrators.code,
            name: CoreUnitAbilityCode.infiltrators.title,
            shortDescription: 'Reserve deployment',
            description: 'During the Declare Battle Formations step, you can set this unit up in Reserves instead of on the battlefield. In the Reinforcements step of one of your Movement phases, you can set this unit up anywhere on the battlefield that is more than 9" horizontally away from all enemy models.'
        )
    ];
}

