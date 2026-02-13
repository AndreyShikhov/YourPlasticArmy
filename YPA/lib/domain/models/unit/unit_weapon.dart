/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../../../core/database/tables/seed/seed_objects/_types.dart';

/// ==========================================
/// WEAPON
/// ==========================================

class WeaponDom
{
    final String name;
    final Map<String, WeaponProfileDom> weapons;

    const WeaponDom({
        required this.name,
        required this.weapons
    });

    Map<String, dynamic> toJson() =>
    {
        'name': name,
        'weapons': weapons.map((key, value) => MapEntry(key, value.toJson()))
    };

    factory WeaponDom.fromJson(Map<String, dynamic> json)
    {
        return WeaponDom(
            name: json['name'] as String? ?? '',
            weapons: (json['weapons'] as Map<String, dynamic>? ?? {}).map(
                (k, v) => MapEntry(k, WeaponProfileDom.fromJson(v as Map<String, dynamic>))
            )
        );
    }

    WeaponDom copyWith({
        String? name,
        Map<String, WeaponProfileDom>? weapons,
    })
    {
        return WeaponDom(
            name: name ?? this.name,
            weapons: weapons ?? this.weapons,
        );
    }

    @override
    bool operator ==(Object other) =>
        identical(this, other) ||
        other is WeaponDom &&
            runtimeType == other.runtimeType &&
            name == other.name;

    @override
    int get hashCode => name.hashCode;
}

class WeaponProfileDom
{
    final List<WeaponAbilitiesCode> weaponAbilities;
    final int range;
    final String attacks;
    final int skill;
    final int strength;
    final int ap;
    final String damage;

    const WeaponProfileDom({
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
        'weaponAbilities': weaponAbilities.map((a) => a.name).toList(),
        'range': range,
        'attacks': attacks,
        'skill': skill,
        'strength': strength,
        'ap': ap,
        'damage': damage
    };

    factory WeaponProfileDom.fromJson(Map<String, dynamic> json)
    {
        return WeaponProfileDom(
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

    WeaponProfileDom copyWith({
        List<WeaponAbilitiesCode>? weaponAbilities,
        int? range,
        String? attacks,
        int? skill,
        int? strength,
        int? ap,
        String? damage,
    })
    {
        return WeaponProfileDom(
            weaponAbilities: weaponAbilities ?? this.weaponAbilities,
            range: range ?? this.range,
            attacks: attacks ?? this.attacks,
            skill: skill ?? this.skill,
            strength: strength ?? this.strength,
            ap: ap ?? this.ap,
            damage: damage ?? this.damage,
        );
    }
}
