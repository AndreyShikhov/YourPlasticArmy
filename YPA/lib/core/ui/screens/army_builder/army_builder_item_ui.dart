import 'package:ypa/domain/models/unit/unit_stats.dart';

class ArmyBuilderUnitItemUi {
  final String name;
  final String role;
  final String m;  // Movement
  final String t;  // Toughness
  final String sv; // Save
  final String isv; // Invulnerable Save
  final String w;  // Wounds
  final String ld; // Leadership
  final String oc; // Objective Control
  final String repeat;
  final List<String> keywords;
  final List<String> factionKeywords;
  final List<Weapon> weapons;

  ArmyBuilderUnitItemUi({
    required this.name,
    required this.role,
    required this.m,
    required this.t,
    required this.sv,
    required this.isv,
    required this.w,
    required this.ld,
    required this.oc,
    required this.repeat,
    required this.keywords,
    required this.factionKeywords,
    required this.weapons,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'role': role,
      'm': m,
      't': t,
      'sv': sv,
      'isv': isv,
      'w': w,
      'ld': ld,
      'oc': oc,
      'keywords': keywords,
      'repeat': repeat,
      'factionKeywords': factionKeywords,
      'weapons': weapons.map((x) => x.toJson()).toList(),
    };
  }

  factory ArmyBuilderUnitItemUi.fromJson(Map<String, dynamic> json) {
    return ArmyBuilderUnitItemUi(
      name: json['name'] ?? '',
      role: json['role'] ?? '',
      m: json['m'] ?? '',
      t: json['t'] ?? '',
      sv: json['sv'] ?? '',
      isv: json['isv'] ?? '',
      w: json['w'] ?? '',
      ld: json['ld'] ?? '',
      oc: json['oc'] ?? '',
      keywords: List<String>.from(json['keywords'] ?? []),
      repeat: json['repeat'] ?? '',
      factionKeywords: List<String>.from(json['factionKeywords'] ?? []),
      weapons: (json['weapons'] as List? ?? [])
          .map((x) => Weapon.fromJson(x as Map<String, dynamic>))
          .toList(),
    );
  }

  factory ArmyBuilderUnitItemUi.empty() {
    return ArmyBuilderUnitItemUi(
      name: '',
      role: '',
      m: '',
      t: '',
      sv: '',
      isv: '',
      w: '',
      ld: '',
      oc: '',
      keywords: [],
      repeat: '',
      factionKeywords: [],
      weapons: [],
    );
  }
}
