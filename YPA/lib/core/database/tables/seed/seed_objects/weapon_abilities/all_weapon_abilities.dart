/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';

List<WeaponAbilitySeed> allWeaponAbilities()
{
    return [
        WeaponAbilitySeed(
            code: WeaponAbilitiesCode.assault.code,
            name: WeaponAbilitiesCode.assault.title,
            shortDescription: 'Shoot after Advance',
            description: 'Models in this unit can make attacks with this weapon even if they Advanced this turn.'
        ),
        WeaponAbilitySeed(
            code: WeaponAbilitiesCode.rapidFire.code,
            name: WeaponAbilitiesCode.rapidFire.title,
            shortDescription: '+X attacks at half range',
            description: 'Increase the Attacks characteristic by the amount x when targeting units within half range.'
        ),
        WeaponAbilitySeed(
            code: WeaponAbilitiesCode.ignoresCover.code,
            name: WeaponAbilitiesCode.ignoresCover.title,
            shortDescription: 'No cover saves',
            description: 'Target cannot have the Benefit of Cover against attacks with this weapon.'
        ),
        WeaponAbilitySeed(
            code:WeaponAbilitiesCode.twinLinked.code,
            name:WeaponAbilitiesCode.twinLinked.title,
            shortDescription: 'Re-roll wounds',
            description: 'Attacks made with this weapon can re-roll the Wound roll.'
        ),
        WeaponAbilitySeed(
            code: WeaponAbilitiesCode.pistol.code,
            name: WeaponAbilitiesCode.pistol.title,
            shortDescription: 'Shoot in melee',
            description: 'Can be fired even if the bearer\'s unit is within Engagement Range of enemy units.'
        ),
        WeaponAbilitySeed(
            code: WeaponAbilitiesCode.torrent.code,
            name: WeaponAbilitiesCode.torrent.title,
            shortDescription: 'Auto-hits',
            description: 'Attacks made with this weapon automatically hit the target (no Hit roll required).'
        ),
        WeaponAbilitySeed(
            code: WeaponAbilitiesCode.lethalHits.code,
            name: WeaponAbilitiesCode.lethalHits.title,
            shortDescription: 'Crit hits auto-wound',
            description: 'Critical Hits (usually unmodified 6s) automatically wound the target.'
        ),
        WeaponAbilitySeed(
            code: WeaponAbilitiesCode.lance.code,
            name: WeaponAbilitiesCode.lance.title,
            shortDescription: '+1 Wound on Charge',
            description: 'Add 1 to Wound rolls if the bearer made a Charge move this turn.'
        ),
        WeaponAbilitySeed(
            code: WeaponAbilitiesCode.indirectFire.code,
            name: WeaponAbilitiesCode.indirectFire.title,
            shortDescription: 'Shoot non-visible',
            description: 'Can target units not visible to the bearer. If targeting non-visible unit: -1 to Hit, target gets Benefit of Cover.'
        ),
        WeaponAbilitySeed(
            code: WeaponAbilitiesCode.blast.code,
            name: WeaponAbilitiesCode.blast.title,
            shortDescription: '+1 Atk per 5 models',
            description: 'Add 1 to the Attacks characteristic for every 5 models in the target unit. Cannot be used in Engagement Range.'
        ),
        WeaponAbilitySeed(
            code: WeaponAbilitiesCode.precision.code,
            name: WeaponAbilitiesCode.precision.title,
            shortDescription: 'Target Characters',
            description: 'When scoring Critical Hits, the attacking player can select a Character model in the target unit to take the damage.'
        ),
        WeaponAbilitySeed(
            code:WeaponAbilitiesCode.melta.code,
            name:WeaponAbilitiesCode.melta.title,
            shortDescription: '+X Dmg at half range',
            description: 'Increase the Damage characteristic by the amount x when targeting units within half range.'
        ),
        WeaponAbilitySeed(
            code: WeaponAbilitiesCode.heavy.code,
            name: WeaponAbilitiesCode.heavy.title,
            shortDescription: '+1 Hit if stationary',
            description: 'Add 1 to Hit rolls if the bearer\'s unit Remained Stationary this turn.'
        ),
        WeaponAbilitySeed(
            code: WeaponAbilitiesCode.hazardous.code,
            name: WeaponAbilitiesCode.hazardous.title,
            shortDescription: 'Risk on 1s',
            description: 'On a Hit roll of 1, the bearer suffers damage or is destroyed after the unit has shot/fought.'
        ),
        WeaponAbilitySeed(
            code: WeaponAbilitiesCode.sustainedHits.code,
            name: WeaponAbilitiesCode.sustainedHits.title,
            shortDescription: 'Exploding 6s',
            description: 'Critical Hits score an additional x hits on the target.'
        ),
        WeaponAbilitySeed(
            code: WeaponAbilitiesCode.extraAttacks.code,
            name: WeaponAbilitiesCode.extraAttacks.title,
            shortDescription: 'Bonus attacks',
            description: 'The bearer can attack with this weapon in addition to any other weapons it is fighting with.'
        ),
        WeaponAbilitySeed(
            code: WeaponAbilitiesCode.devastatingWounds.code,
            name: WeaponAbilitiesCode.devastatingWounds.title,
            shortDescription: 'Bypass saves',
            description: 'Critical Wounds inflict damage that cannot be saved by armour or invulnerable saves.'
        ),
        WeaponAbilitySeed(
            code: WeaponAbilitiesCode.anti.code,
            name: WeaponAbilitiesCode.anti.title,
            shortDescription: 'Crit wound on X+',
            description: 'An unmodified Wound roll of x+ against the specified keyword is a Critical Wound.'
        )
    ];
}
