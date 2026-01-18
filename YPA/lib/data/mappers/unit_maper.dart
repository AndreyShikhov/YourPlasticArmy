import 'package:drift/drift.dart';
import '../../core/database/app_database.dart';
import '../../domain/models/army/army.dart';
import '../../domain/models/codex/codex.dart';
import '../../domain/models/unit/unit.dart';


class UnitMapper {
  static UnitDOM fromRow(UnitRow row) {
    return UnitDOM.restore(
      id: UnitId.fromString(row.id.toString()),
      name: UnitName(row.name),
      armyId: ArmyId.fromInt(row.armyId -1),
      codexId: row.codexId != null ? CodexId.fromString(row.codexId!) : null,
      role: UnitRoleCodeDom.fromInt(row.roleId-1),
      stats: row.stats,
    );
  }


  UnitsCompanion toCompanion(UnitDOM unit) {
    return UnitsCompanion(
      id: Value(unit.id.value),
      name: Value(unit.name.value),
      armyId: Value(unit.armyId.value + 1),
      codexId: unit.codexId != null ? Value(unit.codexId!.value) : const Value.absent(),
      roleId: Value(unit.role.toInt() + 1),
      stats: Value(unit.stats),
    );
  }
}
