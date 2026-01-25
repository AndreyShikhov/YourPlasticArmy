/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import '../_types.dart';

List<EnhancementSeed> enhancementSeed()
{
    return const[
        EnhancementSeed(
            code: 'master_of_war',
            name: 'Master of War',
            description:
            'Once per battle, this model can use a Strategic Ploy Stratagem '
            'for 0CP, even if another unit has already used it this phase.',
            detachmentCode: 'gladius_task_force',
            points: 15
        ),
        EnhancementSeed(
            code: 'adept_of_the_codex',
            name: 'Adept of the Codex',
            description:
            'Each time you gain a Command point, on a 5+ you gain one additional CP.',
            detachmentCode: 'gladius_task_force',
            points: 20
        )
    ];
}
