import 'package:drift/drift.dart';

import '../../core/database/app_database.dart';
import '../../domain/models/enhancement/enhancement_dom.dart';
import '../../domain/models/enhancement/enhancement_id.dart';
import '../../domain/models/enhancement/enhancement_name.dart';
import '../../domain/models/enhancement/enhancement_code.dart';
import '../../domain/models/enhancement/enhancement_description.dart';
import '../../domain/models/detachment/detachment_id.dart';

class EnhancementMapper {
  static EnhancementDOM fromRow(Enhancement row) {
    return EnhancementDOM.restore(
      id: EnhancementId.fromString(row.id),
      code: EnhancementCode(row.code),
      name: EnhancementName(row.name),
      description: EnhancementDescription(row.description),
      detachmentId: DetachmentId.fromString(row.detachmentId.toString()),
      points: row.points,
    );
  }

  static EnhancementsCompanion toCompanion(EnhancementDOM enhancement) {
    return EnhancementsCompanion(
      id: Value(enhancement.id.value),
      code: Value(enhancement.code.value),
      name: Value(enhancement.name.value),
      description: Value(enhancement.description.value),
      detachmentId: Value(enhancement.detachmentId.value),
      points: Value(enhancement.points),
    );
  }
}