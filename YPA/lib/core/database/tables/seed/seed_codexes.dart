import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/codexes/codex.dart';

import '../../../../domain/models/codex/codex_id.dart';
import '../../app_database.dart';



Future<Map<String, String>> seedCodexes(
    AppDatabase db,
    Map<String, int> armyIds,
    ) async {
  final codexes = getAllCodexes();
  final result = <String, String>{};

  for (final c in codexes) {
    // 1. insert or ignore
    await db.into(db.codexes).insert(
      CodexesCompanion.insert(
          id: CodexId.generate().value,
          code: c.code.code,
          name: c.name,
          armyId: armyIds[c.army.code]!
      ),
      mode: InsertMode.insertOrIgnore,
    );

    // 2. select id
    final existing = await (db.select(db.codexes)
      ..where((t) => t.code.equals(c.code.code)))
        .getSingleOrNull();

    if (existing != null) {
      result[c.code.code] = existing.id;
      continue;
    }
  }

  return result;
}


