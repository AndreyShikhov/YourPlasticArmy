import 'package:ypa/domain/models/army/army_id.dart';

import '../../../core/database/tables/seed/seed_objects/_types.dart';
import '../unit/unit_dom.dart';
import 'detachment_id.dart';
import 'detachment_name.dart';

class DetachmentDOM {
  final DetachmentId id;
  final ArmyId armyId;
  final DetachmentName name;

  final List<UnitDOM> _units = [];

  DetachmentDOM._({
    required this.id,
    required this.armyId,
    required this.name,
  });

  factory DetachmentDOM.create({
    required DetachmentName name,
    required ArmyId armyId,
  }) {
    return DetachmentDOM._(
      id: DetachmentId.generate(),
      armyId: armyId,
      name: name,
    );
  }

  factory DetachmentDOM.restore({
    required DetachmentId id,
    required ArmyId armyId,
    required DetachmentName name,
    List<UnitDOM>? units,
  }) {
    final detachment = DetachmentDOM._(
      id: id,
      armyId: armyId,
      name: name,
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

