import 'package:ypa/core/database/tables/seed/seed_objects/detachments/detachment_codex.dart';

import '../../app_database.dart';



Future<void> seedDetachmentCodex(
    AppDatabase db,
    Map<String, int> detachmentIds,
    Map<String, int> codexIds,
    ) async {

  final links = detachmentsCodex();


  for (final link in links) {
    await db.into(db.detachmentCodex).insert(
      DetachmentCodexCompanion.insert(
        detachmentId: detachmentIds[link.detachmentCode]!,
        codexId: codexIds[link.codex]!,
      ),
    );
  }
}
