import 'package:drift/drift.dart';

import '../../app_database.dart';






Future<Map<String, int>> seedArmies(
    AppDatabase db,
    Map<String, int> factionIds,
    ) async {

  final data = [
    ('space_marines', 'Space Marines', 'imperium'),
    ('orks', 'Orks', 'xenos'),
  ];

  final result = <String, int>{};

  for (final (code, name, factionCode) in data) {
    final id = await db.into(db.armies).insert(
      ArmiesCompanion.insert(
          code: code,
          name: name,
          factionId: factionIds[factionCode]!),
      mode: InsertMode.insertOrIgnore,
    );

    result[code] = id;
  }

  return result;
}
