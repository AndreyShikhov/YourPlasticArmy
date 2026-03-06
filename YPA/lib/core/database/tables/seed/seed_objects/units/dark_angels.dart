/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../../../../../../domain/models/unit/unit.dart';
import '../_types.dart';

List<UnitSeed> darkAngelsUnits()
{
    return [

        //=============Characters============

        //=============Battleline============

        UnitSeed(
            id: '20c025c8-5282-4467-91f7-e7f093f1559c',
            name: 'Boyz',
            army: ArmyTypeCode.spaceMarines,
            codex: CodexTypeCode.darkAngels,
            role: UnitRoleCode.battleline,
            repeat: 6,
            keywords: const['Infantry', 'Battleline', 'Mob', 'Orks'],
            factionKeywords: const['Waaagh! Tribe'],
            unitComposition: const UnitCompositionDom(
                compositions: [
                    UnitCompositionModelDom(
                        name: '1 model',
                        amount: 1,
                        cost: 120
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
                'Boyz' : ModelStatsDom(
                    isNeedShow: true,
                    characteristics: const CharacteristicsDom(
                        movement: 6,
                        toughness: 5,
                        save: 5,
                        invulnerableSave: 5,
                        wounds: 1,
                        leadership: 7,
                        objectiveControl: 2
                    ),
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
                    wargearOptions: []
                )
            }
        )
    //=============Dedicated Transports============

    //=============Fortifications============

    //=============Other============

    ];
}
