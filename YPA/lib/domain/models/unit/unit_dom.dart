import 'package:ypa/domain/models/unit/unit.dart';
import '../army/army.dart';
import '../codex/codex.dart';



class UnitDOM {
  final UnitId id;
  final UnitName name;
  final ArmyId armyId;
  final CodexId? codexId;
  final UnitRoleCodeDom role;

  const UnitDOM._({
    required this.id,
    required this.name,
    required this.armyId,
    required this.codexId,
    required this.role,
  });

  factory UnitDOM.restore({
    required UnitId id,
    required UnitName name,
    required ArmyId armyId,
    required CodexId? codexId,
    required UnitRoleCodeDom role,
  }) {
    return UnitDOM._(
      id: id,
      name: name,
      armyId: armyId,
      codexId: codexId,
      role: role,
    );
  }
}
