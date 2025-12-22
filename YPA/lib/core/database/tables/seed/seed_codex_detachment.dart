import 'package:drift/drift.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/detachments/detachment_codex.dart';

import '../../app_database.dart';



Future<void> seedCodexDetachments(
    AppDatabase db,
    Map<String, String> detachmentIds,
    Map<String, String> codexIds,
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

    await db.into(db.codexDetachments).insert(
      CodexDetachmentsCompanion.insert(
        codexId: codexIds[link.codex]!,
        detachmentId: detachmentIds[link.detachmentCode]!,
      ),
      mode: InsertMode.insertOrIgnore,
    );
  }
}
