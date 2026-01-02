import 'package:drift/drift.dart';
import '../../core/database/app_database.dart';
import '../../domain/models/army/army.dart';
import '../../domain/models/detachment/detachment.dart';


class DetachmentMapper {
  static DetachmentDOM fromRow(DetachmentRow row) {
    return DetachmentDOM.restore(
      id: DetachmentId.fromString(row.id),
      code: DetachmentCode(row.code),
      armyId: ArmyId.fromInt(row.armyId),
      name: DetachmentName(row.name),
      description: DetachmentDescription(row.description),
      ruleName: DetachmentRuleName(row.ruleName),
      ruleShort: DetachmentRuleShort(row.ruleShort),
      ruleFull: DetachmentRuleFull(row.ruleFull),
    );
  }

  static DetachmentsCompanion toCompanion(DetachmentDOM detachment) {
    return DetachmentsCompanion(
      id: Value(detachment.id.value),
      code: Value(detachment.code.value),
      armyId: Value(detachment.armyId.value),
      name: Value(detachment.name.value),
      description: Value(detachment.description.value),
      ruleName: Value(detachment.ruleName.value),
      ruleShort: Value(detachment.ruleShort.value),
      ruleFull: Value(detachment.ruleFull.value),
    );
  }
}