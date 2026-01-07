import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';

List<WeaponAbilitySeed> allWeaponAbilities()
{
  return [
    WeaponAbilitySeed(
      code: WeaponAbilitiesCodeX(WeaponAbilitiesCode.assault).SnakeName,
      name: WeaponAbilitiesCodeX(WeaponAbilitiesCode.assault).title,
      shortDescription: 'Shoot after Advance',
      description: 'Models in this unit can make attacks with this weapon even if they Advanced this turn.',
    ),
    WeaponAbilitySeed(
      code: WeaponAbilitiesCodeX(WeaponAbilitiesCode.rapidFire).SnakeName,
      name: WeaponAbilitiesCodeX(WeaponAbilitiesCode.rapidFire).title,
      shortDescription: '+X attacks at half range',
      description: 'Increase the Attacks characteristic by the amount x when targeting units within half range.',
    ),
    WeaponAbilitySeed(
      code: WeaponAbilitiesCodeX(WeaponAbilitiesCode.ignoresCover).SnakeName,
      name: WeaponAbilitiesCodeX(WeaponAbilitiesCode.ignoresCover).title,
      shortDescription: 'No cover saves',
      description: 'Target cannot have the Benefit of Cover against attacks with this weapon.',
    ),
    WeaponAbilitySeed(
      code: WeaponAbilitiesCodeX(WeaponAbilitiesCode.twinLinked).SnakeName,
      name: WeaponAbilitiesCodeX(WeaponAbilitiesCode.twinLinked).title,
      shortDescription: 'Re-roll wounds',
      description: 'Attacks made with this weapon can re-roll the Wound roll.',
    ),
    WeaponAbilitySeed(
      code: WeaponAbilitiesCodeX(WeaponAbilitiesCode.pistol).SnakeName,
      name: WeaponAbilitiesCodeX(WeaponAbilitiesCode.pistol).title,
      shortDescription: 'Shoot in melee',
      description: 'Can be fired even if the bearer\'s unit is within Engagement Range of enemy units.',
    ),
    WeaponAbilitySeed(
      code: WeaponAbilitiesCodeX(WeaponAbilitiesCode.torrent).SnakeName,
      name: WeaponAbilitiesCodeX(WeaponAbilitiesCode.torrent).title,
      shortDescription: 'Auto-hits',
      description: 'Attacks made with this weapon automatically hit the target (no Hit roll required).',
    ),
    WeaponAbilitySeed(
      code: WeaponAbilitiesCodeX(WeaponAbilitiesCode.lethalHits).SnakeName,
      name: WeaponAbilitiesCodeX(WeaponAbilitiesCode.lethalHits).title,
      shortDescription: 'Crit hits auto-wound',
      description: 'Critical Hits (usually unmodified 6s) automatically wound the target.',
    ),
    WeaponAbilitySeed(
      code: WeaponAbilitiesCodeX(WeaponAbilitiesCode.lance).SnakeName,
      name: WeaponAbilitiesCodeX(WeaponAbilitiesCode.lance).title,
      shortDescription: '+1 Wound on Charge',
      description: 'Add 1 to Wound rolls if the bearer made a Charge move this turn.',
    ),
    WeaponAbilitySeed(
      code: WeaponAbilitiesCodeX(WeaponAbilitiesCode.indirectFire).SnakeName,
      name: WeaponAbilitiesCodeX(WeaponAbilitiesCode.indirectFire).title,
      shortDescription: 'Shoot non-visible',
      description: 'Can target units not visible to the bearer. If targeting non-visible unit: -1 to Hit, target gets Benefit of Cover.',
    ),
    WeaponAbilitySeed(
      code: WeaponAbilitiesCodeX(WeaponAbilitiesCode.blast).SnakeName,
      name: WeaponAbilitiesCodeX(WeaponAbilitiesCode.blast).title,
      shortDescription: '+1 Atk per 5 models',
      description: 'Add 1 to the Attacks characteristic for every 5 models in the target unit. Cannot be used in Engagement Range.',
    ),
    WeaponAbilitySeed(
      code: WeaponAbilitiesCodeX(WeaponAbilitiesCode.precision).SnakeName,
      name: WeaponAbilitiesCodeX(WeaponAbilitiesCode.precision).title,
      shortDescription: 'Target Characters',
      description: 'When scoring Critical Hits, the attacking player can select a Character model in the target unit to take the damage.',
    ),
    WeaponAbilitySeed(
      code: WeaponAbilitiesCodeX(WeaponAbilitiesCode.melta).SnakeName,
      name: WeaponAbilitiesCodeX(WeaponAbilitiesCode.melta).title,
      shortDescription: '+X Dmg at half range',
      description: 'Increase the Damage characteristic by the amount x when targeting units within half range.',
    ),
    WeaponAbilitySeed(
      code: WeaponAbilitiesCodeX(WeaponAbilitiesCode.heavy).SnakeName,
      name: WeaponAbilitiesCodeX(WeaponAbilitiesCode.heavy).title,
      shortDescription: '+1 Hit if stationary',
      description: 'Add 1 to Hit rolls if the bearer\'s unit Remained Stationary this turn.',
    ),
    WeaponAbilitySeed(
      code: WeaponAbilitiesCodeX(WeaponAbilitiesCode.hazardous).SnakeName,
      name: WeaponAbilitiesCodeX(WeaponAbilitiesCode.hazardous).title,
      shortDescription: 'Risk on 1s',
      description: 'On a Hit roll of 1, the bearer suffers damage or is destroyed after the unit has shot/fought.',
    ),
    WeaponAbilitySeed(
      code: WeaponAbilitiesCodeX(WeaponAbilitiesCode.sustainedHits).SnakeName,
      name: WeaponAbilitiesCodeX(WeaponAbilitiesCode.sustainedHits).title,
      shortDescription: 'Exploding 6s',
      description: 'Critical Hits score an additional x hits on the target.',
    ),
    WeaponAbilitySeed(
      code: WeaponAbilitiesCodeX(WeaponAbilitiesCode.extraAttacks).SnakeName,
      name: WeaponAbilitiesCodeX(WeaponAbilitiesCode.extraAttacks).title,
      shortDescription: 'Bonus attacks',
      description: 'The bearer can attack with this weapon in addition to any other weapons it is fighting with.',
    ),
    WeaponAbilitySeed(
      code: WeaponAbilitiesCodeX(WeaponAbilitiesCode.devastatingWounds).SnakeName,
      name: WeaponAbilitiesCodeX(WeaponAbilitiesCode.devastatingWounds).title,
      shortDescription: 'Bypass saves',
      description: 'Critical Wounds inflict damage that cannot be saved by armour or invulnerable saves.',
    ),
    WeaponAbilitySeed(
      code: WeaponAbilitiesCodeX(WeaponAbilitiesCode.anti).SnakeName,
      name: WeaponAbilitiesCodeX(WeaponAbilitiesCode.anti).title,
      shortDescription: 'Crit wound on X+',
      description: 'An unmodified Wound roll of x+ against the specified keyword is a Critical Wound.',
    ),
  ];
}
