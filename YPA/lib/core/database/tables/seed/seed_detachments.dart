import 'package:drift/drift.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/detachments/detachments.dart';

import '../../app_database.dart';






Future<Map<String, int>> seedDetachments(AppDatabase db) async {
  final data = detachmentsBase();
  final result = <String, int>{};

  for (final d in data) {
    await db.into(db.detachments).insert(
      DetachmentsCompanion.insert(
        code: d.code,
        name: d.name,
        description: d.description,
        ruleName: d.ruleName,
        ruleShort: d.ruleShort,
        ruleFull: d.ruleFull,
      ),
      mode: InsertMode.insertOrIgnore,
    );

    final id = await (db.select(db.detachments)
      ..where((t) => t.code.equals(d.code)))
        .getSingle()
        .then((row) => row.id);

    result[d.code] = id;
  }

  return result;
}
