/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/


import '../../../../../../domain/models/unit/unit_stats.dart';
import '../_types.dart';

List<UnitSeed> ultramarinesUnits()
{
    return [

        //=============Characters============

        UnitSeed(
            id: 'd69f0c77-7322-437a-921c-4999bed0285b',
            name: 'Roboute Guilliman',
            army: ArmyCode.spaceMarines,
            role: UnitRoleCode.characters,
            codex: CodexCode.ultramarines,
            stats: UnitStats(
                movement: 8,
                toughness: 9,
                save: 2,
                invulnerableSave: 4,
                wounds: 10,
                leadership: 5,
                objectiveControl: 4,
                repeat: 1,
                keywords: [
                    'Infantry',
                    'Battleline',
                    'Grenades',
                    'Imperium',
                    'Tacticus'
                ],
                factionKeywords: ['Adeptus Astartes'],
                weapons:{
                  WeaponType.ranged : [
                    Weapon(
                        name: 'Perdition Pistol',
                        type: WeaponType.ranged,
                        weaponAbilities: const[
                          WeaponAbilitiesCode.pistol,
                          WeaponAbilitiesCode.melta
                        ],
                        range: 6,
                        attacks: const Dice(fix: 1).toString(),
                        skill: 2,
                        strength: 8,
                        ap: -4,
                        damage: const Dice(fix: 0, amount: 1, side: DiceSides.D6)
                            .toString()
                    ),
                  ],
                  WeaponType.melee : [
                    Weapon(
                        name: 'The Axe Mortalis',
                        type: WeaponType.melee,
                        weaponAbilities: const[WeaponAbilitiesCode.lethalHits],
                        range: 0,
                        attacks: const Dice(fix: 8).toString(),
                        skill: 2,
                        strength: 8,
                        ap: -3,
                        damage: const Dice(fix: 2).toString()
                    )
                  ],
                },
                unitComposition: const UnitComposition(
                    compositions: ['1 model'],
                    unitCost: [{1: 120}]
                ),
                unitAbility: const[
                    UnitAbilitiesCode.deepStrike
                ],
                coreAbilities: const[
                    CoreUnitAbilityCode.leader
                ],
                factionAbilities: const[
                    FactionUnitAbilityCode.oathOfMoment
                ],
                ledBy: const[],
                leader: const[],
                wargearOptions: WargearOptions.emptyOptions
            )
        )
    ];
}
