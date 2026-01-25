/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:ypa/domain/models/unit/unit_stats.dart';

import '../_types.dart';

List<UnitSeed> orksUnits()
{
    return [

        //=============Characters============

        //=============Battleline============

        UnitSeed(
            id: '20c025c8-5282-4467-91f7-e7f093f1559c',
            name: 'Boyz',
            army: ArmyCode.orks,
            role: UnitRoleCode.battleline,
            stats: {
              'Boyz' : UnitStats(
                  movement: 6,
                  toughness: 5,
                  save: 5,
                  invulnerableSave: 5,
                  // Waaagh! energy? (обычно 6+ или 0)
                  wounds: 1,
                  leadership: 7,
                  objectiveControl: 2,
                  repeat: 6,
                  keywords: const['Infantry', 'Battleline', 'Mob', 'Orks'],
                  factionKeywords: const['Waaagh! Tribe'],

                  weapons:
                  {
                    WeaponType.ranged : [
                      Weapon(
                          name: 'Slugga',
                          type: WeaponType.ranged,
                          weaponAbilities: [WeaponAbilitiesCode.pistol],
                          range: 12,
                          attacks: const Dice(fix: 1).toString(),
                          skill: 5,
                          strength: 4,
                          ap: 0,
                          damage: const Dice(fix: 1).toString()
                      )
                    ],
                    WeaponType.melee : [
                      Weapon(
                          name: 'Choppa',
                          type: WeaponType.melee,
                          weaponAbilities: const[],
                          range: 0,
                          attacks: const Dice(fix: 3).toString(),
                          skill: 3,
                          strength: 4,
                          ap: -1,
                          damage: const Dice(fix: 1).toString()
                      )
                    ]
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
            }
        )

        //=============Dedicated Transports============

        //=============Fortifications============

        //=============Other============

    ];
}
