import 'package:ypa/domain/models/army/army_id.dart';
import 'package:ypa/domain/models/detachment/detachment_code.dart';
import 'package:ypa/domain/models/detachment/detachment_rule_full.dart';

import '../../domain/models/detachment/detachment_description.dart';
import '../../domain/models/detachment/detachment_dom.dart';
import '../../domain/models/detachment/detachment_name.dart';
import '../../domain/models/detachment/detachment_repository.dart';
import '../../domain/models/detachment/detachment_rule_name.dart';
import '../../domain/models/detachment/detachment_rule_short.dart';

class CreateDetachment {
  final DetachmentRepository repository;

  CreateDetachment(this.repository);

  Future<DetachmentDOM> call({
    required String name,
    required ArmyId armyId,
    required String dtCode,
    required String dtDescription,
    required String dtRuleName,
    required String dtRuleShort,
    required String dtRuleFull,
    required

  }) async {
    final all = await repository.findAll();

    final existing = all.where(
          (d) =>
          d.name.value == name  &&
          d.armyId.value == armyId.value,
    );

    if (existing.isNotEmpty) {
      return existing.first;
    }

    final detachment = DetachmentDOM.create(
        name: DetachmentName(name),
        armyId: ArmyId.fromInt(armyId.value),
        code: DetachmentCode(dtCode),
        description: DetachmentDescription(dtDescription),
        ruleName: DetachmentRuleName(dtRuleName),
        ruleShort: DetachmentRuleShort(dtRuleShort),
        ruleFull: DetachmentRuleFull(dtRuleFull)
    );

    await repository.save(detachment);

    return detachment;
  }
}