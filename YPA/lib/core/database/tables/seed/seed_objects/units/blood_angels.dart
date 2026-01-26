/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import '../../../../../../domain/models/unit/unit.dart';
import '../_types.dart';

List<UnitSeed> bloodAngelsUnits()
{
    return [

        //=============Characters============
        UnitSeed(
            id: '34d7b973-4166-4b6d-9386-235a43405544',
            name: 'Astorath',
            army: ArmyCode.spaceMarines,
            codex: CodexCode.bloodAngels,
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
            modelStats:
            {
                'Astorath' : ModelStatsDom(
                    movement: 12,
                    toughness: 4,
                    save: 2,
                    invulnerableSave: 4,
                    wounds: 5,
                    leadership: 5,
                    objectiveControl: 1,
                    modelWeapons: ModelWeaponsDom(
                      weapons: {
                        WeaponType.ranged : [
                          WeaponDom(
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
                          )
                        ],
                        WeaponType.melee : [
                          WeaponDom(
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
                        ]
                      },
                      selectedWeapons: {
                        WeaponType.ranged : ['Perdition Pistol'],
                        WeaponType.melee : ['The Axe Mortalis']
                      }
                    ),
                    wargearOptions: WargearOptions.emptyOptions
                )
            }
        ),
        UnitSeed(
            id: '18ba4a5a-d3f8-4e4d-8c8e-81c16c571567',
            name: 'Blood Angels Captain',
            army: ArmyCode.spaceMarines,
            codex: CodexCode.bloodAngels,
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
            modelStats:
            {
                'Blood Angels Captain' : ModelStatsDom(
                    movement: 6,
                    toughness: 4,
                    save: 3,
                    invulnerableSave: 4,
                    wounds: 5,
                    leadership: 6,
                    objectiveControl: 1,
                    modelWeapons: ModelWeaponsDom(
                        weapons: {
                          WeaponType.ranged : [
                            WeaponDom(
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
                            )
                          ],
                          WeaponType.melee : [
                            WeaponDom(
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
                          ]
                        },
                        selectedWeapons: {
                          WeaponType.ranged : ['Perdition Pistol'],
                          WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptions.emptyOptions
                )
            }
        ),
        UnitSeed(
            id: 'df139f02-0667-4418-9fa8-6ad64f1ab7ab',
            name: 'Chief Librarian Mephiston',
            army: ArmyCode.spaceMarines,
            codex: CodexCode.bloodAngels,
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
            modelStats:
            {
                'Chief Librarian Mephiston':ModelStatsDom(
                    movement: 7,
                    toughness: 5,
                    save: 2,
                    invulnerableSave: 5,
                    wounds: 6,
                    leadership: 6,
                    objectiveControl: 1,
                    modelWeapons: ModelWeaponsDom(
                        weapons: {
                          WeaponType.ranged : [
                            WeaponDom(
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
                            )
                          ],
                          WeaponType.melee : [
                            WeaponDom(
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
                          ]
                        },
                        selectedWeapons: {
                          WeaponType.ranged : ['Perdition Pistol'],
                          WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptions.emptyOptions
                )
            }
        ),
        UnitSeed(
            id: '01859068-15a0-47b2-a4e1-2c786729505f',
            name: 'Commander Dante',
            army: ArmyCode.spaceMarines,
            codex: CodexCode.bloodAngels,
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
            modelStats: 
            {
                'Commander Dante': ModelStatsDom(
                    movement: 12,
                    toughness: 4,
                    save: 2,
                    invulnerableSave: 4,
                    wounds: 6,
                    leadership: 6,
                    objectiveControl: 1,
                    modelWeapons: ModelWeaponsDom(
                        weapons: {
                          WeaponType.ranged : [
                            WeaponDom(
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
                            )
                          ],
                          WeaponType.melee : [
                            WeaponDom(
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
                          ]
                        },
                        selectedWeapons: {
                          WeaponType.ranged : ['Perdition Pistol'],
                          WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptions.emptyOptions
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
            army: ArmyCode.spaceMarines,
            codex: CodexCode.bloodAngels,
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
            modelStats: 
            {
                'Baal Predator': ModelStatsDom(
                    movement: 12,
                    toughness: 10,
                    save: 3,
                    invulnerableSave: 0,
                    wounds: 11,
                    leadership: 6,
                    objectiveControl: 3,
                    modelWeapons: ModelWeaponsDom(
                        weapons: {
                          WeaponType.ranged : [
                            WeaponDom(
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
                            )
                          ],
                          WeaponType.melee : [
                            WeaponDom(
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
                          ]
                        },
                        selectedWeapons: {
                          WeaponType.ranged : ['Perdition Pistol'],
                          WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptions.emptyOptions
                )
            }
        ),
        UnitSeed(
            id: '7dd1c6bd-1d5f-4061-bf40-238c4d893833',
            name: 'Death Company Dreadnought',
            army: ArmyCode.spaceMarines,
            codex: CodexCode.bloodAngels,
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
            modelStats: 
            {
                'Death Company Dreadnought': ModelStatsDom(
                    movement: 8,
                    toughness: 10,
                    save: 2,
                    invulnerableSave: 0,
                    wounds: 12,
                    leadership: 6,
                    objectiveControl: 4,
                    modelWeapons: ModelWeaponsDom(
                        weapons: {
                          WeaponType.ranged : [
                            WeaponDom(
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
                            )
                          ],
                          WeaponType.melee : [
                            WeaponDom(
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
                          ]
                        },
                        selectedWeapons: {
                          WeaponType.ranged : ['Perdition Pistol'],
                          WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptions.emptyOptions
                )
            }
        ),
        UnitSeed(
            id: 'c57c1aff-b89a-4662-af46-583ae1d0f614',
            name: 'Death Company Marines',
            army: ArmyCode.spaceMarines,
            codex: CodexCode.bloodAngels,
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
            modelStats: 
            {
                'Death Company Marines': ModelStatsDom(
                    movement: 6,
                    toughness: 4,
                    save: 3,
                    invulnerableSave: 0,
                    wounds: 2,
                    leadership: 6,
                    objectiveControl: 1,
                    modelWeapons: ModelWeaponsDom(
                        weapons: {
                          WeaponType.ranged : [
                            WeaponDom(
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
                            )
                          ],
                          WeaponType.melee : [
                            WeaponDom(
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
                          ]
                        },
                        selectedWeapons: {
                          WeaponType.ranged : ['Perdition Pistol'],
                          WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptions.emptyOptions
                )
            }
        ),
        UnitSeed(
            id: '53eadd93-4890-4f04-80eb-daf85b4d893e',
            name: 'Death Company Marines with Bolt Rifles',
            army: ArmyCode.spaceMarines,
            codex: CodexCode.bloodAngels,
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
            modelStats: 
            {
                'Death Company Marines with Bolt Rifles': ModelStatsDom(
                    movement: 6,
                    toughness: 4,
                    save: 3,
                    invulnerableSave: 0,
                    wounds: 2,
                    leadership: 6,
                    objectiveControl: 1,
                    modelWeapons: ModelWeaponsDom(
                        weapons: {
                          WeaponType.ranged : [
                            WeaponDom(
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
                            )
                          ],
                          WeaponType.melee : [
                            WeaponDom(
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
                          ]
                        },
                        selectedWeapons: {
                          WeaponType.ranged : ['Perdition Pistol'],
                          WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptions.emptyOptions
                )
            }
        ),
        UnitSeed(
            id: '05d80275-c689-47f4-bc60-4c3ed36de37f',
            name: 'Death Company Marines With Jump Packs',
            army: ArmyCode.spaceMarines,
            codex: CodexCode.bloodAngels,
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
            modelStats: 
            {
                'Death Company Marines With Jump Packs':ModelStatsDom(
                    movement: 12,
                    toughness: 4,
                    save: 3,
                    invulnerableSave: 0,
                    wounds: 2,
                    leadership: 6,
                    objectiveControl: 1,
                    modelWeapons: ModelWeaponsDom(
                        weapons: {
                          WeaponType.ranged : [
                            WeaponDom(
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
                            )
                          ],
                          WeaponType.melee : [
                            WeaponDom(
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
                          ]
                        },
                        selectedWeapons: {
                          WeaponType.ranged : ['Perdition Pistol'],
                          WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptions.emptyOptions
                )
            }
        ),
        UnitSeed(
            id: '73261196-45a7-4dc4-aef6-8783405fe06b',
            name: 'Sanguinary Guard',
            army: ArmyCode.spaceMarines,
            codex: CodexCode.bloodAngels,
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
            modelStats: 
            {
                'Sanguinary Guard': ModelStatsDom(
                    movement: 12,
                    toughness: 4,
                    save: 2,
                    invulnerableSave: 4,
                    wounds: 3,
                    leadership: 6,
                    objectiveControl: 1,
                    modelWeapons: ModelWeaponsDom(
                        weapons: {
                          WeaponType.ranged : [
                            WeaponDom(
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
                            )
                          ],
                          WeaponType.melee : [
                            WeaponDom(
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
                          ]
                        },
                        selectedWeapons: {
                          WeaponType.ranged : ['Perdition Pistol'],
                          WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptions.emptyOptions
                )
            }
        )
    ];
}
