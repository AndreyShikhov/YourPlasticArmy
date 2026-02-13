/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../../../../../../domain/models/unit/unit.dart';
import '../_types.dart';

List<UnitSeed> ultramarinesUnits()
{
    return [

        //=============Characters============

        UnitSeed(
            id: 'd69f0c77-7322-437a-921c-4999bed0285b',
            name: 'Roboute Guilliman',
            army: ArmyTypeCode.spaceMarines,
            role: UnitRoleCode.characters,
            codex: CodexTypeCode.ultramarines,
            repeat: 1,
            keywords: [
                'Infantry',
                'Battleline',
                'Grenades',
                'Imperium',
                'Tacticus'
            ],
            factionKeywords: ['Adeptus Astartes'],
            unitComposition: const UnitCompositionDom(
                compositions: [
                  UnitCompositionModelDom(
                      name: 'Roboute Guilliman',
                      amount: 1,
                      cost: 300
                  )
                ]
            ),
            unitAbility: const[
            ],
            coreAbilities: const[
                CoreUnitAbilityCode.leader
            ],
            factionAbilities: const[
                FactionUnitAbilityCode.oathOfMoment
            ],
            ledBy: const[],
            leader: const[],
            modelStats: 
            {
                'Roboute Guilliman': ModelStatsDom(
                    movement: 8,
                    toughness: 9,
                    save: 2,
                    invulnerableSave: 4,
                    wounds: 10,
                    leadership: 5,
                    objectiveControl: 4,
                    modelWeapons: ModelWeaponsDom(
                        weapons:
                        {
                          WeaponType.ranged : [
                            WeaponDom(
                                name: 'Perdition Pistol',
                                weapons:
                                {'': WeaponProfileDom(
                                    weaponAbilities: const[
                                      WeaponAbilitiesCode.pistol,
                                      WeaponAbilitiesCode.melta
                                    ],
                                    range: 6,
                                    attacks: const Dice(fix: 1).toString(),
                                    skill: 2,
                                    strength: 8,
                                    ap: -4,
                                    damage: const Dice(fix: 0, amount: 1, side: DiceSides.d6)
                                        .toString()
                                )
                                }

                            )
                          ],
                          WeaponType.melee : [
                            WeaponDom(
                                name: 'The Axe Mortalis',
                                weapons:
                                {'': WeaponProfileDom(
                                    weaponAbilities: const[
                                      WeaponAbilitiesCode.pistol,
                                      WeaponAbilitiesCode.melta
                                    ],
                                    range: 6,
                                    attacks: const Dice(fix: 1).toString(),
                                    skill: 2,
                                    strength: 8,
                                    ap: -4,
                                    damage: const Dice(fix: 0, amount: 1, side: DiceSides.d6)
                                        .toString()
                                )
                                }

                            )
                          ]
                        },
                        selectedWeapons:
                        {
                          WeaponType.ranged : ['Perdition Pistol'],
                          WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),

                    wargearOptions:[]
                )
            }
        )
    ];
}
