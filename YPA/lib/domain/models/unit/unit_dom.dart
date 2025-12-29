import 'package:ypa/domain/models/unit/unit_id.dart';
import 'package:ypa/domain/models/unit/unit_name.dart';
import 'package:ypa/domain/models/unit/unit_roleCode.dart';

import '../army/army_id.dart';
import '../codex/codex_id.dart';



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
