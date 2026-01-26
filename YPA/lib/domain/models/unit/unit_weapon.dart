/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import '../../../core/database/tables/seed/seed_objects/_types.dart';

/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

// ==========================================
// WEAPON
// ==========================================

class WeaponDom
{
  final String name;
  final WeaponType type;
  final List<WeaponAbilitiesCode> weaponAbilities;
  final int range;
  final String attacks;
  final int skill;
  final int strength;
  final int ap;
  final String damage;

  const WeaponDom({
    required this.name,
    required this.type,
    required this.weaponAbilities,
    required this.range,
    required this.attacks,
    required this.skill,
    required this.strength,
    required this.ap,
    required this.damage
  });

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'type': type.name,
        'weaponAbilities': weaponAbilities.map((a) => a.name).toList(),
        'range': range,
        'attacks': attacks,
        'skill': skill,
        'strength': strength,
        'ap': ap,
        'damage': damage
      };

  factory WeaponDom.fromJson(Map<String, dynamic> json)
  {
    return WeaponDom(
        name: json['name'] as String? ?? '',
        type: WeaponType.values.firstWhere(
                (t) => t.name == json['type'],
            orElse: () => WeaponType.none
        ),
        weaponAbilities: (json['weaponAbilities'] as List<dynamic>?)
            ?.map((e) => WeaponAbilitiesCode.values.firstWhere(
                (a) => a.name == e,
            orElse: () => WeaponAbilitiesCode.none
        ))
            .toList() ?? [],
        range: json['range'] as int? ?? 0,
        attacks: json['attacks'] as String? ?? '0',
        skill: json['skill'] as int? ?? 0,
        strength: json['strength'] as int? ?? 0,
        ap: json['ap'] as int? ?? 0,
        damage: json['damage'] as String? ?? '0'
    );
  }
}