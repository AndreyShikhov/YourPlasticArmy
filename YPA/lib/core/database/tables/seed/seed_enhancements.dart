import 'package:drift/drift.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/enhancements/enhancements.dart';
import 'package:uuid/uuid.dart';

import '../../app_database.dart';





Future<void> seedEnhancements(
    AppDatabase db,
    Map<String, int> detachmentIds,
    ) async {
  final seeds = enhancementSeed();

  for (final seed in seeds) {
    if (!detachmentIds.containsKey(seed.detachmentCode)) {
      throw StateError(
        'Seed error: unknown detachment "${seed.detachmentCode}" for enhancement "${seed.code}"',
      );
    }

    await db.into(db.enhancements).insert(
      EnhancementsCompanion.insert(
        id: const Uuid().v4(),
        code: seed.code,
        name: seed.name,
        description: seed.description,
        detachmentId: detachmentIds[seed.detachmentCode]!,
        points: Value(seed.points),
      ),
      mode: InsertMode.insertOrIgnore,
    );
  }
}
