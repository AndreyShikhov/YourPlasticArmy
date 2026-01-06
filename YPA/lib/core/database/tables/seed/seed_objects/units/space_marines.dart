import 'package:ypa/domain/models/unit/unit_stats.dart';
import '../_types.dart';


List<UnitSeed> spaceMarinesUnits() {
  return [

    //=============Characters============


    //=============Battleline============
    UnitSeed(
        id: '68512106-9e6e-419b-a320-f56e927c3905',
        name:  'Intercessor Squad',
        army: ArmyCode.spaceMarines,
        role: UnitRoleCode.battleline,
        stats:  UnitStats(
            movement: 6,
            toughness: 4,
            save: 3,
            invulnerableSave: 0,
            wounds: 2,
            leadership: 6,
            objectiveControl: 2,
            keywords: ['Infantry', 'Battleline', 'Grenades', 'Imperium', 'Tacticus'],
            factionKeywords: ['Adeptus Astartes'],
            weapons: [
              Weapon(
                  name: 'Bolt Rifle',
                  type: WeaponType.ranged,
                  abilities: [WeaponAbility.assault, WeaponAbility.heavy],
                  range: 24,
                  attacks: const Dice(fix: 1).toString(),
                  skill: 3,
                  strength: 4,
                  ap: -1,
                  damage: const Dice(fix: 1).toString()
              ),
              Weapon(
                  name: 'Close Combat Weapon',
                  type: WeaponType.melee,
                  abilities: [],
                  range: 0,
                  attacks: const Dice(fix: 1).toString(),
                  skill: 3,
                  strength: 4,
                  ap: 0,
                  damage: const Dice(fix: 1).toString()
              ),
            ]
        )
    )
    //=============Dedicated Transports============

    //=============Fortifications============

    //=============Other============

  ];
}
