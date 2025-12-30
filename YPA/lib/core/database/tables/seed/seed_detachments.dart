import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/detachments/detachments.dart';

import '../../app_database.dart';

Future<Map<String, String>> seedDetachments(
    AppDatabase db,
    Map<String, int> armyIds,
    ) async {
  final detachments = detachmentsBase();
  final result = <String, String>{};

  // Для Space Marines
  final spaceMarinesArmyId = armyIds['space_marines'];
  if (spaceMarinesArmyId == null) {
    throw StateError('Seed error: space_marines army not found');
  }

  for (final d in detachments) {
    final detachmentId = const Uuid().v4();

    await db.into(db.detachments).insert(
      DetachmentsCompanion.insert(
        id: detachmentId,
        code: d.code,
        name: d.name,
        description: d.description,
        ruleName: d.ruleName,
        ruleShort: d.ruleShort,
        ruleFull: d.ruleFull,
        armyId: spaceMarinesArmyId,
      ),
      mode: InsertMode.insertOrIgnore,
    );

    final existing = await (db.select(db.detachments)
      ..where((t) => t.code.equals(d.code)))
        .getSingleOrNull();

    if (existing != null) {
      result[d.code] = existing.id;
    }
  }

  return result;
}