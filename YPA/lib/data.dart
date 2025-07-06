class  UnitCardData {
    final String unitName;

    final int movement;
    final int toughness;
    final int save;
    final int invulnerableSave;
    final int wounds;
    final int leadership;
    final int objectiveControl;
    final List<int> points;
    final List<String> keywords;



    UnitCardData({
    required this.unitName,
    required this.movement,
    required this.toughness,
    required this.save,
    required this.invulnerableSave,
    required this.wounds,
    required this.leadership,
    required this.objectiveControl,
    required this.points,
    required this.keywords

} );
}

enum TypeWeapon{
  melee,
  ranged
}

enum TypeWeaponAbilities{
  assault,
  rapidFire,
  ignoresCover,
  indirectFire,
  precision,
  hazardous,
  devastatingWounds,
  pistol,
  torrent,
  lethalHits,
  lance,
  blast,
  melta,
  heavy,
  sustainedHits,
  extraAttacks,
  anti
}


class Weapon {

  final String  weaponName;
  final List<TypeWeaponAbilities> weaponAbilities;
  final int attacks;
  final int skill;
  final int strength;
  final int armourPenetration;
  final int damage;

  Weapon({
    required this.weaponName,
    required this.weaponAbilities,
    required this.attacks,
    required this.skill,
    required this.strength,
    required this.armourPenetration,
    required this.damage
  } );
}

class MeleeWeapon extends Weapon{

  static const TypeWeapon type = TypeWeapon.melee;

  MeleeWeapon({
    required super.weaponName,
    required super.weaponAbilities,
    required super.attacks,
    required super.skill,
    required super.strength,
    required super.armourPenetration,
    required super.damage});
}

class RangedWeapon extends Weapon {

  static const TypeWeapon type = TypeWeapon.ranged;
  RangedWeapon({
    required super.weaponName,
    required super.weaponAbilities,
    required super.attacks,
    required super.skill,
    required super.strength,
    required super.armourPenetration,
    required super.damage
  });

}