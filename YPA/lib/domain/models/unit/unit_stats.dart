import '../../../core/database/tables/seed/seed_objects/_types.dart';

// ==========================================
// ENUMS
// ==========================================

enum DiceSides {
  D6,
  D3,
  none,
}

extension DiceSidesX on DiceSides {
  String get text {
    switch (this) {
      case DiceSides.D6: return 'D6';
      case DiceSides.D3: return 'D3';
      case DiceSides.none: return '';
    }
  }
}

// ==========================================
// DICE
// ==========================================

class Dice {
  final int fix;      
  final DiceSides side;
  final int amount;   
  final int modifier; 

  const Dice({
    required this.fix,
    this.side = DiceSides.none,
    this.amount = 0,
    this.modifier = 0,
  });

  @override
  String toString() {
    if (fix > 0) return '$fix';
    return (amount > 0 ? '$amount' : '') + side.name + (modifier > 0 ? ' + $modifier' : '');
  }
}

// ==========================================
// WEAPON
// ==========================================

class Weapon {
  final String name;
  final WeaponType type;
  final List<WeaponAbilitiesCode> weaponAbilities;
  final int range;
  final String attacks;
  final int skill;
  final int strength;
  final int ap;
  final String damage;

  const Weapon({
    required this.name,
    required this.type,
    required this.weaponAbilities,
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
    'weaponAbilities': weaponAbilities.map((a) => a.name).toList(),
    'range': range,
    'attacks': attacks,
    'skill': skill,
    'strength': strength,
    'ap': ap,
    'damage': damage,
  };

  factory Weapon.fromJson(Map<String, dynamic> json) {
    return Weapon(
      name: json['name'] as String? ?? '',
      type: WeaponType.values.firstWhere(
        (t) => t.name == json['type'],
        orElse: () => WeaponType.none,
      ),
      weaponAbilities: (json['weaponAbilities'] as List<dynamic>?)
          ?.map((e) => WeaponAbilitiesCode.values.firstWhere(
                (a) => a.name == e,
                orElse: () => WeaponAbilitiesCode.none, 
              ))
          .toList() ?? [],
      range: json['range'] as int? ?? 0,
      attacks: json['attacks'] as String? ?? '0',
      skill: json['skill'] as int? ?? 0,
      strength: json['strength'] as int? ?? 0,
      ap: json['ap'] as int? ?? 0,
      damage: json['damage'] as String? ?? '0',
    );
  }
}

// ==========================================
// UNIT COMPOSITION
// ==========================================

class UnitComposition {
  final List<String> compositions;
  final List<Map<int, int>> unitCost;

  const UnitComposition({
    required this.compositions,
    required this.unitCost,
  });

  Map<String, dynamic> toJson() => {
    'composition': compositions,
    'unitCost': unitCost.map((m) => m.map((key, value) => MapEntry(key.toString(), value))).toList(),
  };

  factory UnitComposition.fromJson(Map<String, dynamic> json) {
    final rawList = json['unitCost'] as List<dynamic>? ?? [];
    final parsedCost = rawList.map((item) {
      final m = item as Map<String, dynamic>;
      return m.map((key, value) => MapEntry(int.parse(key), value as int));
    }).toList();

    return UnitComposition(
      compositions: List<String>.from(json['composition'] ?? []),
      unitCost: parsedCost,
    );
  }

  static const UnitComposition emptyComposition = UnitComposition(compositions: [], unitCost: []);
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
  final UnitComposition unitComposition;
  final List<UnitAbilitiesCode> unitAbility;
  final List<CoreUnitAbilityCode> coreAbilities;
  final List<FactionUnitAbilityCode> factionAbilities;
  final List<String> leader;
  final List<String> ledBy;

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
    required this.unitComposition,
    required this.unitAbility,
    required this.coreAbilities,
    required this.factionAbilities,
    required this.leader,
    required this.ledBy,
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
    'weapons': weapons.map((w) => w.toJson()).toList(),
    'unitComposition': unitComposition.toJson(),
    'unitAbilities': unitAbility.map((a) => a.name).toList(), 
    'coreAbilities': coreAbilities.map((a) => a.name).toList(),
    'factionAbilities': factionAbilities.map((a) => a.name).toList(),
    'leader': leader,
    'ledBy': ledBy,
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
      keywords: (json['keywords'] as List<dynamic>?)?.cast<String>().toList() ?? [],
      factionKeywords: (json['factionKeywords'] as List<dynamic>?)?.cast<String>().toList() ?? [],
      weapons: (json['weapons'] as List<dynamic>?)
          ?.map((w) => Weapon.fromJson(w as Map<String, dynamic>))
          .toList() ?? [],
      unitComposition: json['unitComposition'] != null
          ? UnitComposition.fromJson(json['unitComposition'] as Map<String, dynamic>)
          : UnitComposition.emptyComposition,
      unitAbility: (json['unitAbilities'] as List<dynamic>?)
          ?.map((e) => UnitAbilitiesCode.values.firstWhere(
                (a) => a.name == e,
                orElse: () => UnitAbilitiesCode.none, 
              ))
          .toList() ?? [],
      coreAbilities: (json['coreAbilities'] as List<dynamic>?)
          ?.map((e) => CoreUnitAbilityCode.values.firstWhere((a) => a.name == e, orElse: () => CoreUnitAbilityCode.none,)).toList() ?? [],
      factionAbilities: (json['factionAbilities'] as List<dynamic>?)
          ?.map((e) => FactionUnitAbilityCode.values.firstWhere((a) => a.name == e, orElse: () => FactionUnitAbilityCode.none,)).toList() ?? [],
      leader: (json['leader'] as List<dynamic>?)?.cast<String>().toList() ?? [],
      ledBy: (json['ledBy'] as List<dynamic>?)?.cast<String>().toList() ?? [],
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
      unitComposition: UnitComposition.emptyComposition,
      unitAbility: [],
      coreAbilities: [],
      factionAbilities: [],
      leader: [],
      ledBy: [],
    );
  }
}
