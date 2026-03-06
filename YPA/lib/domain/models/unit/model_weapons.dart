/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */


import 'package:ypa/domain/models/unit/unit_weapon.dart';

import '../../../core/database/tables/seed/seed_objects/_types.dart';

class ModelWeaponsDom
{
  final Map<WeaponType, List<WeaponDom>> weapons;
  final Map<WeaponType, List<String>> selectedWeapons;

  const ModelWeaponsDom({
    required this.weapons,
    required this.selectedWeapons
  });

  Map<String, dynamic> toJson() =>
      {
        'weapons': weapons.map((type, list) => MapEntry(
            type.name,
            list.map((w) => w.toJson()).toList()
        )),
        'selectedWeapons': selectedWeapons.map((type, list) => MapEntry(
          type.name,
          list,
        )),
      };

  factory ModelWeaponsDom.fromJson(Map<String, dynamic> json) {
    /// Парсинг доступного оружия (объекты)
    final Map<String, dynamic> weaponsRaw = json['weapons'] as Map<String, dynamic>? ?? {};
    final Map<WeaponType, List<WeaponDom>> parsedWeapons = weaponsRaw.map((k, v) {
      final type = WeaponType.values.firstWhere(
              (e) => e.name == k,
        orElse: () => WeaponType.none,
      );
      final list = (v as List<dynamic>?)
          ?.map((e) => WeaponDom.fromJson(e as Map<String, dynamic>))
          .toList() ??
          [];
      return MapEntry(type, list);
    });



    final Map<String, dynamic> selectedRaw = json['selectedWeapons'] as Map<String, dynamic>? ?? {};
    final Map<WeaponType, List<String>> parsedSelected = selectedRaw.map((k, v) {
      final type = WeaponType.values.firstWhere(
            (e) => e.name == k,
        orElse: () => WeaponType.none,
      );
      final list = List<String>.from(v as List? ?? []);
      return MapEntry(type, list);
    });
    return
    ModelWeaponsDom(
      weapons: parsedWeapons,
      selectedWeapons: parsedSelected,
    );
  }


  static const ModelWeaponsDom emptyOptions = ModelWeaponsDom(
    weapons: <WeaponType, List<WeaponDom>>{},
    selectedWeapons: <WeaponType, List<String>>{},
  );

}
