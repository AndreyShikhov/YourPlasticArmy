import 'package:drift/drift.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/enhancements/enhancements.dart';
import 'package:uuid/uuid.dart';

import '../../app_database.dart';





Future<void> seedEnhancements(AppDatabase db) async {

  final enhancementSeeds = enhancementSeed();

  for (final seed in enhancementSeeds) {
    final detachment = await (db.select(db.detachments)
      ..where((d) => d.code.equals(seed.detachmentCode)))
        .getSingle();

    await db.into(db.enhancements).insert(
      EnhancementsCompanion.insert(
          id: const Uuid().v4(),
          code: seed.code,
          name: seed.name,
          description: seed.description,
          detachmentId: detachment.id,
          points: Value(seed.points),
      ),
      mode: InsertMode.insertOrIgnore,
    );
  }
}

