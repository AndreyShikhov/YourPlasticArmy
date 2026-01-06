import 'package:ypa/domain/models/unit/unit_stats.dart';
import '../_types.dart';

List<UnitSeed> bloodAngelsUnits() {
  return [

    //=============Characters============
   UnitSeed(
       id: '01859068-15a0-47b2-a4e1-2c786729505f',
       name: 'Commander Dante',
       army: ArmyCode.spaceMarines,
       codex: CodexCode.bloodAngels,
       role: UnitRoleCode.characters,
       stats: UnitStats(
           movement: 12,
           toughness: 4,
           save: 2,
           invulnerableSave: 4,
           wounds: 6,
           leadership: 6,
           objectiveControl: 1,
           keywords: ['Infantry', 'Character', 'Epic Hero', 'Fly', 'Jump Pack', 'Imperium', 'Chapter Master', 'Commander Dante'],
           factionKeywords: ['Adeptus Astartes', 'Blood Angels'],
           weapons: [
             Weapon(
                 name: 'Perdition Pistol',
                 type: WeaponType.ranged,
                 abilities: [WeaponAbility.pistol, WeaponAbility.melta],
                 range: 6,
                 attacks: const Dice(fix: 1).toString(),
                 skill: 2,
                 strength: 8,
                 ap: -4,
                 damage: const Dice(fix: 0, amount: 1, side: DiceSides.D6).toString()
             ),
             Weapon(
                 name: 'The Axe Mortalis',
                 type: WeaponType.melee,
                 abilities: [WeaponAbility.lethalHits],
                 range: 0, // Melee = 0
                 attacks: const Dice(fix: 8).toString(),
                 skill: 2,
                 strength: 8,
                 ap: -3,
                 damage: const Dice(fix: 2).toString(),
             )
           ]
       )
   )

    //=============Battleline============
    //=============Dedicated Transports============
    //=============Fortifications============
    //=============Other============

  ];
}
