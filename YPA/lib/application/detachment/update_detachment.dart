import 'package:ypa/domain/models/army/army_id.dart';

import '../../domain/models/detachment/detachment_code.dart';
import '../../domain/models/detachment/detachment_description.dart';
import '../../domain/models/detachment/detachment_dom.dart';
import '../../domain/models/detachment/detachment_id.dart';
import '../../domain/models/detachment/detachment_name.dart';
import '../../domain/models/detachment/detachment_repository.dart';
import '../../domain/models/detachment/detachment_rule_full.dart';
import '../../domain/models/detachment/detachment_rule_name.dart';
import '../../domain/models/detachment/detachment_rule_short.dart';

class UpdateDetachment {
  final DetachmentRepository repository;

  UpdateDetachment(this.repository);

  Future<DetachmentDOM> call({
    required String id,
    required String name,
    required ArmyId armyId,
    required String dtCode,
    required String dtDescription,
    required String dtRuleName,
    required String dtRuleShort,
    required String dtRuleFull,
  }) async {
    final detachmentId = DetachmentId.fromString(id);

    final existing =
    await repository.findById(detachmentId);

    if (existing == null) {
      throw StateError('Detachment not found');
    }

    final updated = DetachmentDOM.restore(
      id: existing.id,
      armyId: armyId,
      name: DetachmentName(name),
      code: DetachmentCode(dtCode),
      description: DetachmentDescription(dtDescription),
      ruleName: DetachmentRuleName(dtRuleName),
      ruleShort: DetachmentRuleShort(dtRuleShort),
      ruleFull: DetachmentRuleFull(dtRuleFull)
    );

    await repository.save(updated);

    return updated;
  }
}
