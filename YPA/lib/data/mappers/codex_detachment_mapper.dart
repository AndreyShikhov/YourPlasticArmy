import '../../core/database/app_database.dart';
import '../../domain/models/codex/codex.dart';
import '../../domain/models/detachment/detachment.dart';
import '../../domain/models/relation/codex_detachment_dom.dart';



class CodexDetachmentMapper {
  static CodexDetachmentDOM fromRow(CodexDetachment row) {
    return CodexDetachmentDOM(
      codexId: CodexId.fromString(row.codexId),
      detachmentId: DetachmentId.fromString(row.detachmentId),
    );
  }

  static CodexDetachmentsCompanion toCompanion(
      CodexDetachmentDOM rel,
      ) {
    return CodexDetachmentsCompanion.insert(
      codexId: rel.codexId.value,
      detachmentId: rel.detachmentId.value,
    );
  }
}
