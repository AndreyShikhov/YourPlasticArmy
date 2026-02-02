/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import '../../../../../../domain/models/unit/unit.dart';
import '../_types.dart';

List<UnitSeed> spaceMarinesUnits()
{
    return [

        //=============Characters============

        UnitSeed(
            id: '89e076f9-9c48-4cdc-952f-b069c9d827ad',
            name: 'Ancient',
            army: ArmyTypeCode.spaceMarines,
            role: UnitRoleCode.characters,
            repeat: 1,
            keywords: [
                'Infantry',
                'Battleline',
                'Grenades',
                'Imperium',
                'Tacticus'
            ],
            factionKeywords: ['ADEPTUS ASTARTES'],
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
            leader: [
                LeaderFilterDom(
                    faction: FactionTypeCode.imperium,
                    army: ArmyTypeCode.spaceMarines,
                    names: [
                        'Assault Intercessor Squad',
                        'Desolation Squad',
                        'Devastator Squad',
                        'Hellblaster Squad',
                        'Infernus Squad',
                        'Intercessor Squad',
                        'Sternguard Veteran Squad',
                        'Tactical Squad'
                    ]),
                LeaderFilterDom(
                    faction: FactionTypeCode.imperium,
                    army: ArmyTypeCode.spaceMarines,
                    codex: CodexTypeCode.darkAngels,
                    names: [
                        'Inner Circle Companions'
                    ]),
                LeaderFilterDom(
                    faction: FactionTypeCode.imperium,
                    army: ArmyTypeCode.spaceMarines,
                    codex: CodexTypeCode.deathWatch,
                    names: [
                        'Crusader Squad',
                        'Sternguard Veteran Squad',
                        'Sword Brethren Squad'
                    ])
            ],
            modelStats:
            {
                'Ancient': ModelStatsDom(
                    movement: 6,
                    toughness: 4,
                    save: 3,
                    invulnerableSave: 0,
                    wounds: 4,
                    leadership: 6,
                    objectiveControl: 1,
                    modelWeapons: ModelWeaponsDom(
                        weapons:
                        {
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
                        selectedWeapons:
                        {
                            WeaponType.ranged : ['Perdition Pistol'],
                            WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptionsDom.emptyOptions
                )
            }
        ),
        UnitSeed(
            id: 'd12c01ec-e404-41a5-8ad5-d72f3079d34a',
            name: 'Ancient In Terminator Armour',
            army: ArmyTypeCode.spaceMarines,
            role: UnitRoleCode.characters,
            repeat: 1,
            keywords: [
                'Infantry',
                'Battleline',
                'Grenades',
                'Imperium',
                'Tacticus'
            ],
            factionKeywords: ['ADEPTUS ASTARTES'],
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
                'Ancient In Terminator Armour' : ModelStatsDom(
                    movement: 5,
                    toughness: 5,
                    save: 2,
                    invulnerableSave: 4,
                    wounds: 5,
                    leadership: 5,
                    objectiveControl: 1,
                    modelWeapons: ModelWeaponsDom(
                        weapons:
                        {
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
                        selectedWeapons:
                        {
                            WeaponType.ranged : ['Perdition Pistol'],
                            WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptionsDom.emptyOptions
                )
            }
        ),
        UnitSeed(
            id: '7e580b74-5241-4db5-8948-28d5831f2bf0',
            name: 'Apothecary',
            army: ArmyTypeCode.spaceMarines,
            role: UnitRoleCode.characters,
            repeat: 1,
            keywords: [
                'Infantry',
                'Battleline',
                'Grenades',
                'Imperium',
                'Tacticus'
            ],
            factionKeywords: ['ADEPTUS ASTARTES'],
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
                'Apothecary' :  ModelStatsDom(
                    movement: 6,
                    toughness: 4,
                    save: 3,
                    invulnerableSave: 0,
                    wounds: 4,
                    leadership: 6,
                    objectiveControl: 1,
                    modelWeapons: ModelWeaponsDom(
                        weapons:
                        {
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
                        selectedWeapons:
                        {
                            WeaponType.ranged : ['Perdition Pistol'],
                            WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptionsDom.emptyOptions
                )
            }

        ),
        UnitSeed(
            id: '8338f4f6-d8ee-452d-a593-84f1dc1b64bb',
            name: 'Apothecary Biologis',
            army: ArmyTypeCode.spaceMarines,
            role: UnitRoleCode.characters,
            repeat: 1,
            keywords: [
                'Infantry',
                'Battleline',
                'Grenades',
                'Imperium',
                'Tacticus'
            ],
            factionKeywords: ['ADEPTUS ASTARTES'],
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
                'Apothecary Biologis':ModelStatsDom(
                    movement: 5,
                    toughness: 6,
                    save: 3,
                    invulnerableSave: 0,
                    wounds: 5,
                    leadership: 6,
                    objectiveControl: 3,
                    modelWeapons: ModelWeaponsDom(
                        weapons:
                        {
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
                        selectedWeapons:
                        {
                            WeaponType.ranged : ['Perdition Pistol'],
                            WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptionsDom.emptyOptions
                )
            }
        ),
        //=============Battleline============
        UnitSeed(
            id: '6b80f27a-438b-40b4-bfe3-0aff444a47f6',
            name: 'Assault Intercessor Squad',
            army: ArmyTypeCode.spaceMarines,
            role: UnitRoleCode.battleline,
            repeat: 6,
            keywords: [
                'INFANTRY', 
                'BATTLELINE', 
                'GRENADES', 
                'IMPERIUM', 
                'TACTICUS', 
                'ASSAULT INTERCESSOR SQUAD'
            ],
            factionKeywords: ['ADEPTUS ASTARTES'],
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
            ledBy: const[
                LeaderFilterDom(
                    faction: FactionTypeCode.imperium,
                    army: ArmyTypeCode.spaceMarines,
                    names: [
                        'Adrax Agatone',
                        'Ancient',
                        'Apothecary',
                        'Captain',
                        'Captain Sicarius',
                        'Captain Titus',
                        'Chaplain',
                        'Chief Librarian Tigurius',
                        'Judiciar',
                        'Kor’sarro Khan',
                        'Librarian',
                        'Lieutenant',
                        'Marneus Calgar',
                        'Marneus Calgar in Armour of Antilochus',
                        'Techmarine',
                        'Uriel Ventris',
                        'Vulkan He’stan'
                    ]
                ),
                LeaderFilterDom(
                    faction: FactionTypeCode.imperium,
                    army: ArmyTypeCode.spaceMarines,
                    codex: CodexTypeCode.darkAngels,
                    names: [
                        'Asmodai',
                        'Azrael',
                        'Ezekiel',
                        'Lazarus'
                    ]
                )
            ],
            leader: const[],
            modelStats:
            {
                'Assault Intercessor Sergeant':ModelStatsDom(
                    isNeedShow: false,
                    movement: 6,
                    toughness: 4,
                    save: 3,
                    invulnerableSave: 0,
                    wounds: 2,
                    leadership: 6,
                    objectiveControl: 2,
                    modelWeapons: ModelWeaponsDom(
                        weapons:
                        {
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
                        selectedWeapons:
                        {
                            WeaponType.ranged : ['Perdition Pistol'],
                            WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptionsDom.emptyOptions
                ),
                'Assault Intercessor':ModelStatsDom(
                    isNeedShow: true,
                    movement: 6,
                    toughness: 4,
                    save: 3,
                    invulnerableSave: 0,
                    wounds: 2,
                    leadership: 6,
                    objectiveControl: 2,
                    modelWeapons: ModelWeaponsDom(
                        weapons:
                        {
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
                        selectedWeapons:
                        {
                            WeaponType.ranged : ['Perdition Pistol'],
                            WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptionsDom.emptyOptions
                )
            }
        ),
        UnitSeed(
            id: 'e47ccf5a-c490-41ad-a417-ac7124333243',
            name: 'Heavy Intercessor Squad',
            army: ArmyTypeCode.spaceMarines,
            role: UnitRoleCode.battleline,
            repeat: 6,
            keywords: [
                'INFANTRY', 
                'BATTLELINE', 
                'GRENADES', 
                'IMPERIUM', 
                'GRAVIS', 
                'HEAVY INTERCESSOR SQUAD'
            ],
            factionKeywords: ['ADEPTUS ASTARTES'],
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
                'unyielding_in_the_face_of_the_foe'
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
                        'Apothecary Biologis',
                        'Captain In Gravis Armour',
                        'Iron Father Feirros',
                        'Marneus Calgar',
                        'Marneus Calgar in Armour of Antilochus',
                        'Tor Garadon'
                    ]
                ),
                LeaderFilterDom(
                    faction: FactionTypeCode.imperium,
                    army: ArmyTypeCode.imperialAgents,
                    names: [
                        'Inquisitor',
                        'Inquisitor Coteaz',
                        'Inquisitor Draxus',
                        'Inquisitor Greyfax'
                    ]
                )
            ],
            leader: const[],
            modelStats:
            {
                'Heavy Intercessor Sergeant' : ModelStatsDom(
                    isNeedShow: false,
                    movement: 5,
                    toughness: 6,
                    save: 3,
                    invulnerableSave: 0,
                    wounds: 3,
                    leadership: 6,
                    objectiveControl: 2,
                    modelWeapons: ModelWeaponsDom(
                        weapons:
                        {
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
                        selectedWeapons:
                        {
                            WeaponType.ranged : ['Perdition Pistol'],
                            WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptionsDom.emptyOptions
                ),
                'Heavy Intercessor' : ModelStatsDom(
                    movement: 5,
                    toughness: 6,
                    save: 3,
                    invulnerableSave: 0,
                    wounds: 3,
                    leadership: 6,
                    objectiveControl: 2,
                    modelWeapons: ModelWeaponsDom(
                        weapons:
                        {
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
                        selectedWeapons:
                        {
                            WeaponType.ranged : ['Perdition Pistol'],
                            WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptionsDom.emptyOptions
                )
            }
        ),
        UnitSeed(
            id: '1f215c1e-d037-4a94-897b-955e4abfb53a',
            name: 'Intercessor Squad',
            army: ArmyTypeCode.spaceMarines,
            role: UnitRoleCode.battleline,
            repeat: 6,
            keywords: [
                'INFANTRY',
                'BATTLELINE', 
                'GRENADES', 
                'IMPERIUM',
                'TACTICUS',
                'INTERCESSOR SQUAD'
            ],
            factionKeywords: ['ADEPTUS ASTARTES'],
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
                'objective_secured',
                'target_elimination'
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
                'Intercessor Sergeant' : ModelStatsDom(
                    isNeedShow: false,
                    movement: 6,
                    toughness: 4,
                    save: 3,
                    invulnerableSave: 0,
                    wounds: 2,
                    leadership: 6,
                    objectiveControl: 2,
                    modelWeapons: ModelWeaponsDom(
                        weapons:
                        {
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
                        selectedWeapons:
                        {
                            WeaponType.ranged : ['Perdition Pistol'],
                            WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptionsDom.emptyOptions
                ),
                'Intercessor' : ModelStatsDom(
                    movement: 6,
                    toughness: 4,
                    save: 3,
                    invulnerableSave: 0,
                    wounds: 2,
                    leadership: 6,
                    objectiveControl: 2,
                    modelWeapons: ModelWeaponsDom(
                        weapons:
                        {
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
                        selectedWeapons:
                        {
                            WeaponType.ranged : ['Perdition Pistol'],
                            WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptionsDom.emptyOptions
                )
            }
        ),
        UnitSeed(
            id: '722e5c10-9b8e-4c68-a1e1-f699a2d24d46',
            name: 'Tactical Squad',
            army: ArmyTypeCode.spaceMarines,
            role: UnitRoleCode.battleline,
            repeat: 6,
            keywords: [
                'INFANTRY', 
                'BATTLELINE',
                'GRENADES',
                'IMPERIUM', 
                'TACTICAL SQUAD'
            ],
            factionKeywords: ['ADEPTUS ASTARTES'],
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
                'Tactical' : ModelStatsDom(
                    movement: 6,
                    toughness: 4,
                    save: 3,
                    invulnerableSave: 0,
                    wounds: 2,
                    leadership: 6,
                    objectiveControl: 2,
                    modelWeapons: ModelWeaponsDom(
                        weapons:
                        {
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
                        selectedWeapons:
                        {
                            WeaponType.ranged : ['Perdition Pistol'],
                            WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptionsDom.emptyOptions
                )
            }
        ),

        //=============Dedicated Transports============

        UnitSeed(
            id: '43b62024-0810-488a-aa74-baa7c774967f',
            name: 'Drop Pod',
            army: ArmyTypeCode.spaceMarines,
            role: UnitRoleCode.dedicatedTransports,
            repeat: 6,
            keywords: [
                'Infantry',
                'Battleline',
                'Grenades',
                'Imperium',
                'Tacticus'
            ],
            factionKeywords: ['ADEPTUS ASTARTES'],
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
                'Drop Pod' :  ModelStatsDom(
                    movement: 0,
                    toughness: 7,
                    save: 3,
                    invulnerableSave: 0,
                    wounds: 8,
                    leadership: 6,
                    objectiveControl: 0,

                    modelWeapons: ModelWeaponsDom(
                        weapons:
                        {
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
                        selectedWeapons:
                        {
                            WeaponType.ranged : ['Perdition Pistol'],
                            WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptionsDom.emptyOptions
                )
            }
        ),
        UnitSeed(
            id: '2f13a097-f22f-4511-9e2d-bb23ae72816a',
            name: 'Impulsor',
            army: ArmyTypeCode.spaceMarines,
            role: UnitRoleCode.dedicatedTransports,
            repeat: 6,
            keywords: [
                'Infantry',
                'Battleline',
                'Grenades',
                'Imperium',
                'Tacticus'
            ],
            factionKeywords: ['ADEPTUS ASTARTES'],
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
                'Impulsor' : ModelStatsDom(
                    movement: 12,
                    toughness: 9,
                    save: 3,
                    invulnerableSave: 0,
                    wounds: 11,
                    leadership: 6,
                    objectiveControl: 2,
                    modelWeapons: ModelWeaponsDom(
                        weapons:
                        {
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
                        selectedWeapons:
                        {
                            WeaponType.ranged : ['Perdition Pistol'],
                            WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptionsDom.emptyOptions
                )
            }
        ),
        UnitSeed(
            id: '8cb7df8d-14d7-4fe1-a25b-3cc8990b53c5',
            name: 'Razorback',
            army: ArmyTypeCode.spaceMarines,
            role: UnitRoleCode.dedicatedTransports,
            repeat: 6,
            keywords: [
                'Infantry',
                'Battleline',
                'Grenades',
                'Imperium',
                'Tacticus'
            ],
            factionKeywords: ['ADEPTUS ASTARTES'],
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
                'Razorback' : ModelStatsDom(
                    movement: 12,
                    toughness: 9,
                    save: 3,
                    invulnerableSave: 0,
                    wounds: 10,
                    leadership: 6,
                    objectiveControl: 2,
                    modelWeapons: ModelWeaponsDom(
                        weapons:
                        {
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
                        selectedWeapons:
                        {
                            WeaponType.ranged : ['Perdition Pistol'],
                            WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptionsDom.emptyOptions
                )
            }
        ),
        UnitSeed(
            id: 'c45084e0-b576-494e-ac4c-ab3d26d3f22b',
            name: 'Rhino',
            army: ArmyTypeCode.spaceMarines,
            role: UnitRoleCode.dedicatedTransports,
            repeat: 6,
            keywords: [
                'Infantry',
                'Battleline',
                'Grenades',
                'Imperium',
                'Tacticus'
            ],
            factionKeywords: ['ADEPTUS ASTARTES'],
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
                'Rhino' : ModelStatsDom(
                    movement: 12,
                    toughness: 9,
                    save: 3,
                    invulnerableSave: 0,
                    wounds: 10,
                    leadership: 6,
                    objectiveControl: 2,
                    modelWeapons: ModelWeaponsDom(
                        weapons:
                        {
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
                        selectedWeapons:
                        {
                            WeaponType.ranged : ['Perdition Pistol'],
                            WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptionsDom.emptyOptions
                )
            }
        ),
        //=============Fortifications============
        UnitSeed(
            id: '71e80c3f-3c16-4d82-ac99-740c10f007a7',
            name: 'Hammerfall Bunker',
            army: ArmyTypeCode.spaceMarines,
            role: UnitRoleCode.fortifications,
            repeat: 3,
            keywords: [
                'Infantry',
                'Battleline',
                'Grenades',
                'Imperium',
                'Tacticus'
            ],
            factionKeywords: ['ADEPTUS ASTARTES'],
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
                'Hammerfall Bunker' : ModelStatsDom(
                    movement: 0,
                    toughness: 12,
                    save: 2,
                    invulnerableSave: 0,
                    wounds: 14,
                    leadership: 6,
                    objectiveControl: 0,
                    modelWeapons: ModelWeaponsDom(
                        weapons:
                        {
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
                        selectedWeapons:
                        {
                            WeaponType.ranged : ['Perdition Pistol'],
                            WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptionsDom.emptyOptions
                )
            }
        ),

        //=============Other============
        UnitSeed(
            id: 'f766279f-68f8-4217-8a64-c481668f4735',
            name: 'Aggressor Squad',
            army: ArmyTypeCode.spaceMarines,
            role: UnitRoleCode.other,
            repeat: 3,
            keywords: [
                'Infantry',
                'Battleline',
                'Grenades',
                'Imperium',
                'Tacticus'
            ],
            factionKeywords: ['ADEPTUS ASTARTES'],
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
                'Aggressor' : ModelStatsDom(
                    movement: 5,
                    toughness: 6,
                    save: 3,
                    invulnerableSave: 0,
                    wounds: 3,
                    leadership: 6,
                    objectiveControl: 1,
                    modelWeapons: ModelWeaponsDom(
                        weapons:
                        {
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
                        selectedWeapons:
                        {
                            WeaponType.ranged : ['Perdition Pistol'],
                            WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptionsDom.emptyOptions
                )
            }
        ),
        UnitSeed(
            id: 'b7318d19-e05a-456a-9abb-13c74c2040d8',
            name: 'Assault Intercessors With Jump Packs',
            army: ArmyTypeCode.spaceMarines,
            role: UnitRoleCode.other,
            repeat: 3,
            keywords: [
                'Infantry',
                'Battleline',
                'Grenades',
                'Imperium',
                'Tacticus'
            ],
            factionKeywords: ['ADEPTUS ASTARTES'],
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
                'Assault Intercessors With Jump Packs' :  ModelStatsDom(
                    movement: 12,
                    toughness: 4,
                    save: 3,
                    invulnerableSave: 0,
                    wounds: 2,
                    leadership: 6,
                    objectiveControl: 1,
                    modelWeapons: ModelWeaponsDom(
                        weapons:
                        {
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
                        selectedWeapons:
                        {
                            WeaponType.ranged : ['Perdition Pistol'],
                            WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptionsDom.emptyOptions
                )
            }
        ),
        UnitSeed(
            id: 'e3a23096-322d-4eba-8fef-f6d66d11168a',
            name: 'Ballistus Dreadnought',
            army: ArmyTypeCode.spaceMarines,
            role: UnitRoleCode.other,
            repeat: 3,
            keywords: [
                'Infantry',
                'Battleline',
                'Grenades',
                'Imperium',
                'Tacticus'
            ],
            factionKeywords: ['ADEPTUS ASTARTES'],
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
                'Ballistus Dreadnought' :ModelStatsDom(
                    movement: 8,
                    toughness: 10,
                    save: 2,
                    invulnerableSave: 0,
                    wounds: 12,
                    leadership: 6,
                    objectiveControl: 4,
                    modelWeapons: ModelWeaponsDom(
                        weapons:
                        {
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
                        selectedWeapons:
                        {
                            WeaponType.ranged : ['Perdition Pistol'],
                            WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptionsDom.emptyOptions
                )
            }
        ),
        UnitSeed(
            id: '3066649e-238a-4144-b806-a73c2b20dda8',
            name: 'Bladeguard Veteran Squad',
            army: ArmyTypeCode.spaceMarines,
            role: UnitRoleCode.other,
            repeat: 3,
            keywords: [
                'Infantry',
                'Battleline',
                'Grenades',
                'Imperium',
                'Tacticus'
            ],
            factionKeywords: ['ADEPTUS ASTARTES'],
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
                'Bladeguard Veteran': ModelStatsDom(
                    movement: 6,
                    toughness: 4,
                    save: 3,
                    invulnerableSave: 4,
                    wounds: 3,
                    leadership: 6,
                    objectiveControl: 1,
                    modelWeapons: ModelWeaponsDom(
                        weapons:
                        {
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
                        selectedWeapons:
                        {
                            WeaponType.ranged : ['Perdition Pistol'],
                            WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptionsDom.emptyOptions
                )
            }
        ),
        UnitSeed(
            id: 'b0b6e585-80ba-46e0-8826-4916d0f8e1a1',
            name: 'Outrider Squad',
            army: ArmyTypeCode.spaceMarines,
            role: UnitRoleCode.other,
            repeat: 3,
            keywords: [
                'Mounted',
                'Grenades',
                'Imperium',
                'Outrider Squad'
            ],
            factionKeywords: ['Adeptus Astartes'],
            unitComposition:
            const UnitCompositionDom(
                compositions: [
                    UnitCompositionModelDom(
                        name: 'Outrider Squad',
                        amount: 3,
                        cost: 80
                    ),
                    UnitCompositionModelDom(
                        name: 'Outrider Squad',
                        amount: 6,
                        cost: 160
                    )
                ],
                additionalModels: [
                    UnitCompositionModelDom(
                        name: 'Invader ATV', 
                        amount: 1, 
                        cost: 60)
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
                'Bladeguard Veteran': ModelStatsDom(
                    movement: 6,
                    toughness: 4,
                    save: 3,
                    invulnerableSave: 4,
                    wounds: 3,
                    leadership: 6,
                    objectiveControl: 1,
                    modelWeapons: ModelWeaponsDom(
                        weapons:
                        {
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
                        selectedWeapons:
                        {
                            WeaponType.ranged : ['Perdition Pistol'],
                            WeaponType.melee : ['The Axe Mortalis']
                        }
                    ),
                    wargearOptions: WargearOptionsDom.emptyOptions
                )
            }
        )
    ];
}
