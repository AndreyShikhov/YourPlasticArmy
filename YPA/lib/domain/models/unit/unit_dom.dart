import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
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


  factory UnitDOM.create({
    required UnitName name,
    required ArmyId armyId,
    required CodexId? codexId,
    required UnitRoleCodeDom role,
  }){
    return UnitDOM._(
        id: UnitId.fromString(Uuid().v4()),
        name: name,
        armyId: armyId,
        codexId: codexId,
        role: role);
  }


  UnitDOM copyWith({
    UnitName? name,
    ArmyId? armyId,
    Object? codexId = const _Sentinel(),
    UnitRoleCodeDom? role,
  }) {
    return UnitDOM._(
      id: this.id,
      name: name ?? this.name,
      armyId: armyId ?? this.armyId,
      codexId: codexId == const _Sentinel()
          ? this.codexId
          : (codexId as CodexId?),
      role: role ?? this.role,
    );
  }


}
class _Sentinel {
  const _Sentinel();
}