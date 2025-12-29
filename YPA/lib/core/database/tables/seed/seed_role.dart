import 'package:drift/drift.dart';

import '../../app_database.dart';






Future<Map<String, int>> seedRole(
    AppDatabase db,
    ) async {
  final data =
    [
      'Characters',
      'Battleline',
      'Dedicated Transports',
      'Fortifications',
      'Other',
    ];


  final result = <String, int>{};

  for (final role in data) {
    final id = await db.into(db.role).insert(
      RoleCompanion.insert(
        code: role.toLowerCase().replaceAll(' ', '_'), // уникальный code
        name: role, // отображаемое имя
      ),
      mode: InsertMode.insertOrIgnore,
    );
    result[role] = id;
  }

  return result;
}
