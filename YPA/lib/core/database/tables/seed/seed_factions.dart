import 'dart:ffi';

import 'package:drift/drift.dart';

import '../../app_database.dart';






Future<Map<String, int>> seedFactions(AppDatabase db) async {
  final data = [
    ('imperium', 'Imperium'),
    ('chaos', 'Chaos'),
    ('xenos', 'Xenos'),
  ];

  final result = <String, int>{};

  for (final (code, name) in data) {
    final id = await db.into(db.factions).insert(
      FactionsCompanion.insert(
        code: code,
        name: name,
      ),
      mode: InsertMode.insertOrIgnore,
    );

    result[code] = id;
  }

  return result;
}

