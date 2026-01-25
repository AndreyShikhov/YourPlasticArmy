import 'package:drift/drift.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';
import '../../core/database/app_database.dart';
import '../../domain/models/army/army.dart';
import '../../domain/models/codex/codex.dart';
import '../../domain/models/unit/unit.dart';

class UnitMapper {
  static UnitDOM fromRow(UnitRow row) {
    return UnitDOM.restore(
      id: UnitId.fromString(row.id),
      name: UnitName(row.name),
      armyId: ArmyId.fromString(row.armyId),
      codexId: row.codexId != null ? CodexId.fromString(row.codexId!) : null,
      role: UnitRoleCodeDom.fromString(row.roleCode),
      stats: row.stats,
    );
  }

  static UnitsCompanion toCompanion(UnitDOM unit) {
    return UnitsCompanion(
      id: Value(unit.id.value),
      name: Value(unit.name.value),
      armyId: Value(unit.armyId.value),
      codexId: unit.codexId != null ? Value(unit.codexId!.value) : const Value.absent(),
      roleCode: Value(unit.role.value.code),
      stats: Value(unit.stats),
    );
  }
}
