import 'package:drift/drift.dart';

import '../../app_database.dart';



Future<Map<String, int>> seedCodexes(
    AppDatabase db,
    Map<String, int> armyIds,
    ) async {

  final data = [
    ('ultramarines', 'Ultramarines', 'space_marines'),
    ('blood_angels', 'Blood Angels', 'space_marines'),
  ];

  final result = <String, int>{};

  for (final (code, name, armyCode) in data) {
    final id = await db.into(db.codexes).insert(
      CodexesCompanion.insert(
        code: code,
        name: name,
        armyId: armyIds[armyCode]!,
      ),
      mode: InsertMode.insertOrIgnore,
    );

    result[code] = id;
  }

  return result;
}

