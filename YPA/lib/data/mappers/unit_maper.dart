import 'package:drift/drift.dart';

import '../../core/database/app_database.dart';
import '../../domain/models/army/army_id.dart';
import '../../domain/models/codex/codex_id.dart';
import '../../domain/models/unit/unit_dom.dart';
import '../../domain/models/unit/unit_id.dart';
import '../../domain/models/unit/unit_name.dart';
import '../../domain/models/unit/unit_roleCode.dart';


class UnitMapper {
  static UnitDOM fromRow(UnitRow row) {
    return UnitDOM.restore(
      id: UnitId.fromString(row.id.toString()),
      name: UnitName(row.name),
      armyId: ArmyId.fromInt(row.armyId),
      codexId: row.codexId != null ? CodexId.fromString(row.codexId!) : null,
      role: UnitRoleCodeDom.fromInt(row.roleId),
    );
  }


  UnitsCompanion toCompanion(UnitDOM unit) {
    return UnitsCompanion(
      id: Value(unit.id.value),
      name: Value(unit.name.value),
      armyId: Value(unit.armyId.value),
      codexId: unit.codexId != null ? Value(unit.codexId!.value) : const Value.absent(),
      roleId: Value(unit.role.toInt()),
    );
  }
}
