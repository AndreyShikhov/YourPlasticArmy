import 'dart:convert';

import 'package:uuid/uuid.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';

import '../unit/unit.dart';
import '../user_army/user_army_repository.dart';
import 'user_roster_unit_dom.dart';

class UserRosterDOM {
  final int version;
  final Map<UnitRoleCode, List<UserRosterUnitDOM>> categories;

  UserRosterDOM({
    required this.version,
    required this.categories,
  });

  // Создание из JSON строки
  factory UserRosterDOM.fromJson(String jsonStr) {
    if (jsonStr.isEmpty) return UserRosterDOM(version: 1, categories: {});

    final Map<String, dynamic> data = jsonDecode(jsonStr);
    final Map<String, dynamic> catsJson = data['categories'] ?? {};

    final Map<UnitRoleCode, List<UserRosterUnitDOM>> categories = {};

    catsJson.forEach((key, value) {
      final role = UnitRoleCodeX.fromTitle(key); // Или другой ваш маппер кодов
      if (role != null && value is List) {
        categories[role] = value
            .map((e) => UserRosterUnitDOM.fromMap(e as Map<String, dynamic>))
            .toList();
      }
    });

    return UserRosterDOM(
      version: data['version'] ?? 1,
      categories: categories,
    );
  }

  // Превращение в JSON строку
  String toJson() {
    final Map<String, dynamic> data = {
      'version': version,
      'categories': categories.map((key, value) => MapEntry(
        key.title, // Используем title как ключ в JSON
        value.map((e) => e.toMap()).toList(),
      )),
    };
    return jsonEncode(data);
  }

  // Метод добавления юнита
  UserRosterDOM addUnit(String unitId, UnitRoleCode role) {
    final newUnit = UserRosterUnitDOM(
      instanceId: const Uuid().v4(),
      unitId: unitId,
      wargearOptions: {}, // Пусто по умолчанию
    );

    final updatedCategories = Map<UnitRoleCode, List<UserRosterUnitDOM>>.from(categories);
    final unitList = List<UserRosterUnitDOM>.from(updatedCategories[role] ?? []);
    unitList.add(newUnit);
    updatedCategories[role] = unitList;

    return UserRosterDOM(version: version, categories: updatedCategories);
  }
}
























