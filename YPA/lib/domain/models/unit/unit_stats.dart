import '../../../core/database/tables/seed/seed_objects/_types.dart';

// ==========================================
// ENUMS
// ==========================================



enum WeaponAbility {
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
  anti,
  twinLinked,
}

enum DiceSides{
  D6,
  D3,
  none,
}

extension DiceSidesX on DiceSides
{
  String get text
  {
    switch(this)
    {
     case DiceSides.D6:
        return 'D6';
      case DiceSides.D3:
        return 'D3';
      case DiceSides.none:
        return '';
    }
  }

}

// ==========================================
// DICE
// ==========================================

class Dice {
  final int fix;      // Фиксированное значение (если есть)
  final DiceSides side;     // Количество граней (например 6 для D6)
  final int amount;   // Количество кубов (например 2 для 2D6)
  final int modifier; // Модификатор (например +1)

  const Dice({
    required this.fix,
    this.side = DiceSides.none,
    this.amount = 0,
    this.modifier = 0,
  });


  @override
  String toString() {

    if (amount == 0 && fix > 0) return '$fix';
    return '${amount}D${DiceSidesX(side).text}' + (modifier != 0 ? ' + $modifier' : '');
  }
}

// ==========================================
// WEAPON
// ==========================================

class Weapon {
  final String name;
  final WeaponType type;
  final List<WeaponAbility> abilities;
  final int range;    // "Melee", "24\""
  final String attacks;  // "1", "D6", "2D3"
  final int skill;    // "3+", "2+"
  final int strength;
  final int ap;          // 0, -1, -2
  final String damage;   // "1", "D3", "3"

  const Weapon({
    required this.name,
    required this.type,
    required this.abilities,
    required this.range,
    required this.attacks,
    required this.skill,
    required this.strength,
    required this.ap,
    required this.damage,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'type': type.name,
    'abilities': abilities.map((e) => e.name).toList(),
    'range': range,
    'attacks': attacks,
    'skill': skill,
    'strength': strength,
    'ap': ap,
    'damage': damage,
  };

  factory Weapon.fromJson(Map<String, dynamic> json) {
    return Weapon(
      name: json['name'] as String,
      type: WeaponType.values.firstWhere(
            (e) => e.name == json['type'],
        orElse: () => WeaponType.melee,
      ),
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((e) => WeaponAbility.values.firstWhere(
            (a) => a.name == e,
        orElse: () => WeaponAbility.assault,
      ))
          .toList() ??
          [],
      range: json['range'] as int,
      attacks: json['attacks'] as String,
      skill: json['skill'] as int,
      strength: json['strength'] as int,
      ap: json['ap'] as int,
      damage: json['damage'] as String,
    );
  }
}

// ==========================================
// UNIT STATS
// ==========================================

class UnitStats {
  final int movement;
  final int toughness;
  final int save;
  final int invulnerableSave;
  final int wounds;
  final int leadership;
  final int objectiveControl;
  final List<String> keywords;
  final List<String> factionKeywords;
  final List<Weapon> weapons;

  const UnitStats({
    required this.movement,
    required this.toughness,
    required this.save,
    required this.invulnerableSave,
    required this.wounds,
    required this.leadership,
    required this.objectiveControl,
    required this.keywords,
    required this.factionKeywords,
    required this.weapons,
  });

  Map<String, dynamic> toJson() => {
    'movement': movement,
    'toughness': toughness,
    'save': save,
    'invulnerableSave': invulnerableSave,
    'wounds': wounds,
    'leadership': leadership,
    'objectiveControl': objectiveControl,
    'keywords': keywords,
    'factionKeywords': factionKeywords,
    'weapons': weapons.map((e) => e.toJson()).toList(),
  };

  factory UnitStats.fromJson(Map<String, dynamic> json) {
    return UnitStats(
      movement: json['movement'] as int? ?? 0,
      toughness: json['toughness'] as int? ?? 0,
      save: json['save'] as int? ?? 0,
      invulnerableSave: json['invulnerableSave'] as int? ?? 0,
      wounds: json['wounds'] as int? ?? 1,
      leadership: json['leadership'] as int? ?? 6,
      objectiveControl: json['objectiveControl'] as int? ?? 0,
      keywords: (json['keywords'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      factionKeywords: (json['factionKeywords'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      weapons: (json['weapons'] as List<dynamic>?)
          ?.map((e) => Weapon.fromJson(e as Map<String, dynamic>))
          .toList() ??
          [],
    );
  }

  factory UnitStats.empty() {
    return const UnitStats(
      movement: 0,
      toughness: 0,
      save: 0,
      invulnerableSave: 0,
      wounds: 0,
      leadership: 0,
      objectiveControl: 0,
      keywords: [],
      factionKeywords: [],
      weapons: [],
    );
  }
}
