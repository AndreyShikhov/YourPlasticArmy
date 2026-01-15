import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/factions/factions.dart';

import '../../app_database.dart';






Future<Map<String, int>> seedFactions(AppDatabase db) async {
  final data = getAllFactions();
  final result = <String, int>{};

  for (final faction in data) {
    final code = faction.code.code; // Берем строковый код (например, 'imperium')

    // 1. Проверяем, существует ли уже такая фракция
    final existing = await (db.select(db.factions)
      ..where((tbl) => tbl.code.equals(code)))
        .getSingleOrNull();

    int id;
    if (existing != null) {
      id = existing.id;
    } else {
      // 2. Если нет, вставляем новую
      id = await db.into(db.factions).insert(
        FactionsCompanion.insert(
          code: code,
          name: faction.code.title, // Красивое имя из Extension
        ),
      );
    }

    // Сохраняем ID в карту, используя строковый код как ключ
    result[code] = id;
  }

  return result;
}

