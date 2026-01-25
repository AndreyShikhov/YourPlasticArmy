/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import '../_types.dart';

List<StrategemsSeed> strategemsSeed()
{
    return const[
        StrategemsSeed(
            id: '8eb74213-bf38-4093-a9ae-066110c218f0',
            code: StratagemsCode.eitherPlayersTurn,
            name: 'Command Re-roll',
            when:
            'Any phase, just after you make an Advance roll, a Charge roll, a Desperate Escape test or a Hazardous test for a unit from your army, or a Hit roll, a Wound roll, a Damage roll or a saving throw for a model in that unit, or a roll to determine the number of attacks made with a weapon equipped by a model in that unit. If you are using fast dice rolling, this Stratagem can still be used after rolling multiple rolls or saving throws at once.',
            target: 'That unit or model from your army.',
            effect:
            'You re-roll that roll, test or saving throw. If you are using fast dice rolling, select one of those rolls or saving throws to re-roll.',
            cost: 1,
            codexId: null,
            detachmentId: null

        )
    ];
}
