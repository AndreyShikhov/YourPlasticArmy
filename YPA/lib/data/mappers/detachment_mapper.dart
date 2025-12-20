import 'package:drift/drift.dart';

import '../../core/database/app_database.dart';
import '../../domain/models/detachment/detachment_dom.dart';
import '../../domain/models/detachment/detachment_id.dart';
import '../../domain/models/detachment/detachment_name.dart';

class DetachmentMapper {
  static DetachmentDOM fromRow(DetachmentRow row) {
    return DetachmentDOM.restore(
        id: DetachmentId.fromString(row.id),
        name: DetachmentName(row.name)
    );
  }

  static DetachmentsCompanion toCompanion(
      DetachmentDOM detachment,
      ) {
    return DetachmentsCompanion(
      id: Value(detachment.id.value),
      name: Value(detachment.name.value),
    );
  }
}
