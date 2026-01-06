import 'package:drift/drift.dart';

import '../../app_database.dart';
import 'seed_objects/_types.dart';






Future<Map<String, int>> seedRole(AppDatabase db,) async {
  final data =
    [
      UnitRoleCode.characters,
      UnitRoleCode.battleline,
      UnitRoleCode.dedicatedTransports,
      UnitRoleCode.fortifications,
      UnitRoleCode.other,
    ];


  final result = <String, int>{};

  for (final role in data) {
    // Используем role.code везде для согласованности
    final existing = await (db.select(db.role)..where((tbl) => tbl.code.equals(role.code))).getSingleOrNull();
    
    int id;
    if (existing != null) {
      id = existing.id;
    } else {
      id = await db.into(db.role).insert(
        RoleCompanion.insert(
          code: role.code, // уникальный code (например, dedicatedTransports)
          name: role.title, // отображаемое имя (Dedicated Transports)
        ),
        mode: InsertMode.insertOrIgnore,
      );
    }
    
    // Сохраняем в карту именно КОД
    result[role.code] = id;
  }

  return result;
}
