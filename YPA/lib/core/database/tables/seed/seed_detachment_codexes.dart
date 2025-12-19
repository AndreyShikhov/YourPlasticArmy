import 'package:drift/drift.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/detachments/detachment_codex.dart';

import '../../app_database.dart';



Future<void> seedDetachmentCodex(
    AppDatabase db,
    Map<String, int> detachmentIds,
    Map<String, int> codexIds,
    ) async {
  final links = detachmentsCodex();

  for (final link in links) {
    if (!detachmentIds.containsKey(link.detachmentCode)) {
      throw StateError(
        'Seed error: unknown detachment "${link.detachmentCode}"',
      );
    }

    if (!codexIds.containsKey(link.codex)) {
      throw StateError(
        'Seed error: unknown codex "${link.codex}"',
      );
    }

    await db.into(db.detachmentCodex).insert(
      DetachmentCodexCompanion.insert(
        detachmentId: detachmentIds[link.detachmentCode]!,
        codexId: codexIds[link.codex]!,
      ),
      mode: InsertMode.insertOrIgnore,
    );
  }
}
