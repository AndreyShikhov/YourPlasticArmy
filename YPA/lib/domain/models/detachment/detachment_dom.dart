import 'package:ypa/domain/models/army/army_id.dart';

import '../../../core/database/tables/seed/seed_objects/_types.dart';
import '../unit/unit_dom.dart';
import 'detachment_id.dart';
import 'detachment_name.dart';
import 'detachment_code.dart';
import 'detachment_description.dart';
import 'detachment_rule_name.dart';
import 'detachment_rule_short.dart';
import 'detachment_rule_full.dart';

class DetachmentDOM {
  final DetachmentId id;
  final DetachmentCode code;
  final ArmyId armyId;
  final DetachmentName name;
  final DetachmentDescription description;
  final DetachmentRuleName ruleName;
  final DetachmentRuleShort ruleShort;
  final DetachmentRuleFull ruleFull;

  final List<UnitDOM> _units = [];

  DetachmentDOM._({
    required this.id,
    required this.code,
    required this.armyId,
    required this.name,
    required this.description,
    required this.ruleName,
    required this.ruleShort,
    required this.ruleFull,
  });

  factory DetachmentDOM.create({
    required DetachmentCode code,
    required ArmyId armyId,
    required DetachmentName name,
    required DetachmentDescription description,
    required DetachmentRuleName ruleName,
    required DetachmentRuleShort ruleShort,
    required DetachmentRuleFull ruleFull,
  }) {
    return DetachmentDOM._(
      id: DetachmentId.generate(),
      code: code,
      armyId: armyId,
      name: name,
      description: description,
      ruleName: ruleName,
      ruleShort: ruleShort,
      ruleFull: ruleFull,
    );
  }

  factory DetachmentDOM.restore({
    required DetachmentId id,
    required DetachmentCode code,
    required ArmyId armyId,
    required DetachmentName name,
    required DetachmentDescription description,
    required DetachmentRuleName ruleName,
    required DetachmentRuleShort ruleShort,
    required DetachmentRuleFull ruleFull,
    List<UnitDOM>? units,
  }) {
    final detachment = DetachmentDOM._(
      id: id,
      code: code,
      armyId: armyId,
      name: name,
      description: description,
      ruleName: ruleName,
      ruleShort: ruleShort,
      ruleFull: ruleFull,
    );
    if (units != null) {
      detachment._units.addAll(units);
    }
    return detachment;
  }

  List<UnitDOM> get units => List.unmodifiable(_units);

  void addUnit(UnitDOM unit, Set<UnitRoleCode> allowedUnitRoleCode) {
    if (!canAddUnit(unit, allowedUnitRoleCode)) {
      throw Exception('Этот юнит нельзя добавить в данный Detachment');
    }
    _units.add(unit);
  }

  void removeUnit(UnitDOM unit) {
    _units.remove(unit);
  }

  bool canAddUnit(UnitDOM unit, Set<UnitRoleCode> allowedUnitRoleCode) {
    int existingCount = _units.where((u) => u.id == unit.id).length;

    if (!allowedUnitRoleCode.contains(unit.role)) return false;

    return true;
  }
}

