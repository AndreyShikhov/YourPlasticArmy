/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../../../../../../domain/models/unit/unit.dart';
import '../_types.dart';

List<UnitSeed> bloodAngelsUnits()
{
    return [

        //=============Characters============
        UnitSeed(
            id: '34d7b973-4166-4b6d-9386-235a43405544',
            name: 'Astorath',
            army: ArmyTypeCode.spaceMarines,
            codex: CodexTypeCode.bloodAngels,
            role: UnitRoleCode.characters,
            isEpicHero: true,
            repeat: 1,
            keywords: [
                'Infantry',
                'Character',
                'Epic Hero',
                'Fly',
                'Jump Pack',
                'Imperium',
                'Chapter Master',
                'Commander Dante'
            ],
            factionKeywords: ['Adeptus Astartes', 'Blood Angels'],
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
                'Astorath' : ModelStatsDom(

                    characteristics: const CharacteristicsDom(
                        movement: 12,
                        toughness: 4,
                        save: 2,
                        invulnerableSave: 4,
                        wounds: 5,
                        leadership: 5,
                        objectiveControl: 1
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
        ),
        UnitSeed(
            id: '18ba4a5a-d3f8-4e4d-8c8e-81c16c571567',
            name: 'Blood Angels Captain',
            army: ArmyTypeCode.spaceMarines,
            codex: CodexTypeCode.bloodAngels,
            role: UnitRoleCode.characters,
            repeat: 1,
            keywords: [
                'Infantry',
                'Character',
                'Epic Hero',
                'Fly',
                'Jump Pack',
                'Imperium',
                'Chapter Master',
                'Commander Dante'
            ],
            factionKeywords: ['Adeptus Astartes', 'Blood Angels'],
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
                'Blood Angels Captain' : ModelStatsDom(
                    characteristics: const CharacteristicsDom(
                        movement: 12,
                        toughness: 4,
                        save: 2,
                        invulnerableSave: 4,
                        wounds: 5,
                        leadership: 5,
                        objectiveControl: 1
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
        ),
        UnitSeed(
            id: 'df139f02-0667-4418-9fa8-6ad64f1ab7ab',
            name: 'Chief Librarian Mephiston',
            army: ArmyTypeCode.spaceMarines,
            codex: CodexTypeCode.bloodAngels,
            role: UnitRoleCode.characters,
            isEpicHero: true,
            repeat: 1,
            keywords: [
                'Infantry',
                'Character',
                'Epic Hero',
                'Fly',
                'Jump Pack',
                'Imperium',
                'Chapter Master',
                'Commander Dante'
            ],
            factionKeywords: ['Adeptus Astartes', 'Blood Angels'],
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
                'Chief Librarian Mephiston':ModelStatsDom(
                    characteristics: const CharacteristicsDom(
                        movement: 12,
                        toughness: 4,
                        save: 2,
                        invulnerableSave: 4,
                        wounds: 5,
                        leadership: 5,
                        objectiveControl: 1
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
        ),
        UnitSeed(
            id: '01859068-15a0-47b2-a4e1-2c786729505f',
            name: 'Commander Dante',
            army: ArmyTypeCode.spaceMarines,
            codex: CodexTypeCode.bloodAngels,
            role: UnitRoleCode.characters,
            isEpicHero: true,
            repeat: 1,
            keywords: [
                'Infantry',
                'Character',
                'Epic Hero',
                'Fly',
                'Jump Pack',
                'Imperium',
                'Chapter Master',
                'Commander Dante'
            ],
            factionKeywords: ['Adeptus Astartes', 'Blood Angels'],
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
                'shock_assault'
            ],
            coreAbilities: const[
                CoreUnitAbilityCode.leader
            ],
            factionAbilities: const[
                FactionUnitAbilityCode.oathOfMoment
            ],
            ledBy: const[],
            leader: const[
                LeaderFilterDom(
                    faction: FactionTypeCode.imperium,
                    army: ArmyTypeCode.spaceMarines,
                    names: [
                        'Assault Intercessors With Jump Packs',
                        'Vanguard Veteran Squad With Jump Packs'
                    ]
                ),
                LeaderFilterDom(
                    faction: FactionTypeCode.imperium,
                    army: ArmyTypeCode.spaceMarines,
                    codex: CodexTypeCode.bloodAngels,
                    names: [
                        'Sanguinary Guard'
                    ]
                )
            ],
            modelStats:
            {
                'Commander Dante': ModelStatsDom(
                    characteristics: const CharacteristicsDom(
                        movement: 12,
                        toughness: 4,
                        save: 2,
                        invulnerableSave: 4,
                        wounds: 5,
                        leadership: 5,
                        objectiveControl: 1
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
        ),

        //=============Battleline============
        //=============Dedicated Transports============
        //=============Fortifications============
        //=============Other============

        UnitSeed(
            id: '57c9a939-1ecb-4a34-adaa-d4a92b46f07d',
            name: 'Baal Predator',
            army: ArmyTypeCode.spaceMarines,
            codex: CodexTypeCode.bloodAngels,
            role: UnitRoleCode.other,
            repeat: 3,
            keywords: [
                'Infantry',
                'Character',
                'Epic Hero',
                'Fly',
                'Jump Pack',
                'Imperium',
                'Chapter Master',
                'Commander Dante'
            ],
            factionKeywords: ['Adeptus Astartes', 'Blood Angels'],
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
                'Baal Predator': ModelStatsDom(
                    characteristics: const CharacteristicsDom(
                        movement: 12,
                        toughness: 4,
                        save: 2,
                        invulnerableSave: 4,
                        wounds: 5,
                        leadership: 5,
                        objectiveControl: 1
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
        ),
        UnitSeed(
            id: '7dd1c6bd-1d5f-4061-bf40-238c4d893833',
            name: 'Death Company Dreadnought',
            army: ArmyTypeCode.spaceMarines,
            codex: CodexTypeCode.bloodAngels,
            role: UnitRoleCode.other,
            repeat: 3,
            keywords: [
                'Infantry',
                'Character',
                'Epic Hero',
                'Fly',
                'Jump Pack',
                'Imperium',
                'Chapter Master',
                'Commander Dante'
            ],
            factionKeywords: ['Adeptus Astartes', 'Blood Angels'],
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
                'Death Company Dreadnought': ModelStatsDom(
                    characteristics: const CharacteristicsDom(
                        movement: 12,
                        toughness: 4,
                        save: 2,
                        invulnerableSave: 4,
                        wounds: 5,
                        leadership: 5,
                        objectiveControl: 1
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
        ),
        UnitSeed(
            id: 'c57c1aff-b89a-4662-af46-583ae1d0f614',
            name: 'Death Company Marines',
            army: ArmyTypeCode.spaceMarines,
            codex: CodexTypeCode.bloodAngels,
            role: UnitRoleCode.other,
            repeat: 3,
            keywords: [
                'Infantry',
                'Character',
                'Epic Hero',
                'Fly',
                'Jump Pack',
                'Imperium',
                'Chapter Master',
                'Commander Dante'
            ],
            factionKeywords: ['Adeptus Astartes', 'Blood Angels'],
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
                'Death Company Marines': ModelStatsDom(
                    characteristics: const CharacteristicsDom(
                        movement: 12,
                        toughness: 4,
                        save: 2,
                        invulnerableSave: 4,
                        wounds: 5,
                        leadership: 5,
                        objectiveControl: 1
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
        ),
        UnitSeed(
            id: '53eadd93-4890-4f04-80eb-daf85b4d893e',
            name: 'Death Company Marines with Bolt Rifles',
            army: ArmyTypeCode.spaceMarines,
            codex: CodexTypeCode.bloodAngels,
            role: UnitRoleCode.other,
            repeat: 3,
            keywords: [
                'Infantry',
                'Character',
                'Epic Hero',
                'Fly',
                'Jump Pack',
                'Imperium',
                'Chapter Master',
                'Commander Dante'
            ],
            factionKeywords: ['Adeptus Astartes', 'Blood Angels'],
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
                'Death Company Marines with Bolt Rifles': ModelStatsDom(
                    characteristics: const CharacteristicsDom(
                        movement: 12,
                        toughness: 4,
                        save: 2,
                        invulnerableSave: 4,
                        wounds: 5,
                        leadership: 5,
                        objectiveControl: 1
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
        ),
        UnitSeed(
            id: '05d80275-c689-47f4-bc60-4c3ed36de37f',
            name: 'Death Company Marines With Jump Packs',
            army: ArmyTypeCode.spaceMarines,
            codex: CodexTypeCode.bloodAngels,
            role: UnitRoleCode.other,
            repeat: 3,
            keywords: [
                'Infantry',
                'Character',
                'Epic Hero',
                'Fly',
                'Jump Pack',
                'Imperium',
                'Chapter Master',
                'Commander Dante'
            ],
            factionKeywords: ['Adeptus Astartes', 'Blood Angels'],
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
                'Death Company Marines With Jump Packs':ModelStatsDom(
                    characteristics: const CharacteristicsDom(
                        movement: 12,
                        toughness: 4,
                        save: 2,
                        invulnerableSave: 4,
                        wounds: 5,
                        leadership: 5,
                        objectiveControl: 1
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
        ),
        UnitSeed(
            id: '73261196-45a7-4dc4-aef6-8783405fe06b',
            name: 'Sanguinary Guard',
            army: ArmyTypeCode.spaceMarines,
            codex: CodexTypeCode.bloodAngels,
            role: UnitRoleCode.other,
            repeat: 3,
            keywords: [
                'Infantry',
                'Character',
                'Epic Hero',
                'Fly',
                'Jump Pack',
                'Imperium',
                'Chapter Master',
                'Commander Dante'
            ],
            factionKeywords: ['Adeptus Astartes', 'Blood Angels'],
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
            ledBy: const[
                LeaderFilterDom(
                    faction: FactionTypeCode.imperium,
                    army: ArmyTypeCode.spaceMarines,
                    names: [
                        'Captain With Jump Pack'
                    ]
                ),
                LeaderFilterDom(
                    faction: FactionTypeCode.imperium,
                    army: ArmyTypeCode.spaceMarines,
                    codex: CodexTypeCode.bloodAngels,
                    names: [
                        'Commander Dante'
                    ]
                )
            ],
            leader: const[],
            modelStats:
            {
                'Sanguinary Guard': ModelStatsDom(
                    characteristics: const CharacteristicsDom(
                        movement: 12,
                        toughness: 4,
                        save: 2,
                        invulnerableSave: 4,
                        wounds: 5,
                        leadership: 5,
                        objectiveControl: 1
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
    ];
}
