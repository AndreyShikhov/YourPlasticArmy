/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import '../../../core/database/tables/seed/seed_objects/_types.dart';

// ==========================================
// ENUMS
// ==========================================

enum DiceSides
{
    D6,
    D3,
    none
}

extension DiceSidesX on DiceSides
{
    String get text
    {
        switch (this)
        {
            case DiceSides.D6: return 'D6';
            case DiceSides.D3: return 'D3';
            case DiceSides.none: return '';
        }
    }
}

// ==========================================
// DICE
// ==========================================

class Dice
{
    final int fix;      
    final DiceSides side;
    final int amount;   
    final int modifier; 

    const Dice({
        required this.fix,
        this.side = DiceSides.none,
        this.amount = 0,
        this.modifier = 0
    });

    @override
    String toString()
    {
        if (fix > 0) return '$fix';
        return (amount > 0 ? '$amount' : '') + side.name + (modifier > 0 ? ' + $modifier' : '');
    }
}

// ==========================================
// WEAPON
// ==========================================

class Weapon
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

    const Weapon({
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

    factory Weapon.fromJson(Map<String, dynamic> json)
    {
        return Weapon(
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

// ==========================================
// UNIT COMPOSITION
// ==========================================

class UnitComposition
{
    final List<String> compositions;
    final List<Map<int, int>> unitCost;   // key - amount models / value - pts
    final Map<int, int>? selectedComposition; // key - amount models / value - pts

    const UnitComposition({
        required this.compositions,
        required this.unitCost,
        this.selectedComposition
    });

    // ==========================================
    // Getters
    // ==========================================

    Map<int, int> get effectiveComposition =>
    (selectedComposition?.isNotEmpty ?? false) ? selectedComposition! : unitCost.first;

    // ==========================================
    // JSON
    // ==========================================
    Map<String, dynamic> toJson() =>
    {
        'composition': compositions,
        'unitCost': unitCost.map((m) => m.map((key, value) => MapEntry(key.toString(), value))).toList(),
        'selectedComposition': selectedComposition
    };

    factory UnitComposition.fromJson(Map<String, dynamic> json)
    {
        final rawList = json['unitCost'] as List<dynamic>? ?? [];
        final parsedCost = rawList.map((item)
            {
                final m = item as Map<String, dynamic>;
                return m.map((key, value) => MapEntry(int.parse(key), value as int));
            }).toList();

        return UnitComposition(
            compositions: List<String>.from(json['composition'] ?? []),
            unitCost: parsedCost,
            selectedComposition: Map<int, int>.from(json['selectedComposition'] ?? {})
        );
    }

    static const UnitComposition emptyComposition = UnitComposition(compositions: [], unitCost: [], selectedComposition: {});
}

// ==========================================
// WARGEAR OPTIONS
// ==========================================

class WargearOptions
{
    final List<Map<String, List<String>>> wargearOptions;

    const WargearOptions({
        required this.wargearOptions
    });

    Map<String, dynamic> toJson() =>
    {
        'wargear_options': wargearOptions
    };

    factory WargearOptions.fromJson(Map<String, dynamic> json)
    {
        final rawOptions = (json['wargear_options'] as List<dynamic>?) ?? [];
        final List<Map<String, List<String>>> parsedOptions = rawOptions.map((item)
            {
                final map = item as Map<String, dynamic>;
                return map.map((key, value)
                    {
                        return MapEntry(key, (value as List).cast<String>().toList());
                    });
            }).toList();

        return WargearOptions(wargearOptions: parsedOptions);
    }

    static const WargearOptions emptyOptions = WargearOptions(wargearOptions: []);
}

// ==========================================
// UNIT STATS
// ==========================================

class ModelStats
{
    final bool? isNeedShow;
    final int movement;
    final int toughness;
    final int save;
    final int invulnerableSave;
    final int wounds;
    final int leadership;
    final int objectiveControl;
    final Map<WeaponType, List<Weapon>> weapons;
    final WargearOptions wargearOptions;

    const ModelStats({
        this.isNeedShow = false,
        required this.movement,
        required this.toughness,
        required this.save,
        required this.invulnerableSave,
        required this.wounds,
        required this.leadership,
        required this.objectiveControl,
        required this.weapons,
        required this.wargearOptions
    });

    Map<String, dynamic> toJson() =>
    {
        'isNeedShow': isNeedShow,
        'movement': movement,
        'toughness': toughness,
        'save': save,
        'invulnerableSave': invulnerableSave,
        'wounds': wounds,
        'leadership': leadership,
        'objectiveControl': objectiveControl,
        'weapons': weapons.map((type, list) => MapEntry(
                type.name,
                list.map((w) => w.toJson()).toList()
            ))
    };

    factory ModelStats.fromJson(Map<String, dynamic> json)
    {

        final Map<String, dynamic> weaponsRaw = json['weapons'] as Map<String, dynamic>? ?? {};
        final Map<WeaponType, List<Weapon>> parsedWeapons = weaponsRaw.map((key, value)
            {
                final type = WeaponType.values.firstWhere(
                    (e) => e.name == key,
                    orElse: () => WeaponType.none
                );
                final list = (value as List<dynamic>)
                    .map((e) => Weapon.fromJson(e as Map<String, dynamic>))
                    .toList();
                return MapEntry(type, list);
            });

        return ModelStats(
            isNeedShow: json['isNeedShow'] as bool? ?? false,
            movement: json['movement'] as int? ?? 0,
            toughness: json['toughness'] as int? ?? 0,
            save: json['save'] as int? ?? 0,
            invulnerableSave: json['invulnerableSave'] as int? ?? 0,
            wounds: json['wounds'] as int? ?? 1,
            leadership: json['leadership'] as int? ?? 6,
            objectiveControl: json['objectiveControl'] as int? ?? 0,
            weapons: parsedWeapons,
            wargearOptions: WargearOptions.fromJson(json)
        );
    }

    factory ModelStats.empty()
    {
        return const ModelStats(
            isNeedShow: false,
            movement: 0,
            toughness: 0,
            save: 0,
            invulnerableSave: 0,
            wounds: 0,
            leadership: 0,
            objectiveControl: 0,
            weapons: {},
            wargearOptions: WargearOptions.emptyOptions
        );
    }
}
