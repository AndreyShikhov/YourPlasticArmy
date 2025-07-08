
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
    // serialize
    Map<String, dynamic> toJson() =>{
      'Name' : unitName,
      'Movement' : movement,
      'Toughness' : toughness,
      'Save' : save,
      'Invulnerable Save' : invulnerableSave,
      'Wounds' : wounds,
      'Leadership' : leadership,
      'Objective Control' : objectiveControl,
      'Points' : points,
      'Keywords' : keywords
    };

    // deserialize
  static UnitCardData fromJson(Map<String, dynamic> json) => UnitCardData(
      unitName: json['Name'] as String,
      movement:  json ['Movement' ] as int,
      toughness: json['Toughness'] as int,
      save: json['Save'] as int,
      invulnerableSave: json['Invulnerable Save' ] as int,
      wounds: json['Wounds'] as int,
      leadership: json['Leadership'] as int,
      objectiveControl: json['Objective Control'] as int,
      points: (json['Points'] as List).map((element) => element as int).toList(),
      keywords: (json['Keywords'] as List).map((element) => element as String).toList()
  );


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