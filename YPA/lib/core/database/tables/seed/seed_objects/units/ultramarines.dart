
import '../../../../../../domain/models/unit/unit_stats.dart';
import '../_types.dart';

List<UnitSeed> ultramarinesUnits() {
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
          wargearOptions: WargearOptions.emptyOptions,
        )
    ),
  ];
}
