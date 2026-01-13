import 'package:ypa/domain/models/unit/unit_stats.dart';
import '../_types.dart';


List<UnitSeed> spaceMarinesUnits() {
  return [

    //=============Characters============


    //=============Battleline============
    UnitSeed(
        id: '68512106-9e6e-419b-a320-f56e927c3905',
        name: 'Intercessor Squad',
        army: ArmyCode.spaceMarines,
        role: UnitRoleCode.battleline,
        stats: UnitStats(
          movement: 6,
          toughness: 4,
          save: 3,
          invulnerableSave: 0,
          wounds: 2,
          leadership: 6,
          objectiveControl: 2,
          keywords: [
            'Infantry',
            'Battleline',
            'Grenades',
            'Imperium',
            'Tacticus'
          ],
          factionKeywords: ['Adeptus Astartes'],
          weapons: [
            Weapon(
                name: 'Bolt Rifle',
                type: WeaponType.ranged,
                weaponAbilities: [
                  WeaponAbilitiesCode.assault,
                  WeaponAbilitiesCode.heavy
                ],
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
                weaponAbilities: [],
                range: 0,
                attacks: const Dice(fix: 1).toString(),
                skill: 3,
                strength: 4,
                ap: 0,
                damage: const Dice(fix: 1).toString()
            ),
          ],
          unitComposition: const UnitComposition(
              compositions: ['1 model'],
              unitCost: [{1: 120}]
          ),
          unitAbility: const [
            UnitAbilitiesCode.deepStrike,
          ],
          coreAbilities: const [
            CoreUnitAbilityCode.leader,
          ],
          factionAbilities: const [
            FactionUnitAbilityCode.oathOfMoment,
          ],
          ledBy: const [],
          leader: const [],
        )
    )
    //=============Dedicated Transports============

    //=============Fortifications============

    //=============Other============

  ];
}
