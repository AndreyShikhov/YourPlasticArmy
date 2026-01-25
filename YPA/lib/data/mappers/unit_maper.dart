/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:drift/drift.dart';

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
      role: UnitRoleCodeDom.fromString(row.roleCode).value,
      // Drift автоматически применяет UnitStatsConverter, 
      // поэтому row.stats уже имеет тип Map<String, UnitStats>
      stats: row.stats,
    );
  }

  static UnitsCompanion toCompanion(UnitDOM unit) {
    return UnitsCompanion(
      id: Value(unit.id.value),
      name: Value(unit.name.value),
      armyId: Value(unit.armyId.value),
      codexId: unit.codexId != null 
          ? Value(unit.codexId!.value) 
          : const Value.absent(),
      roleCode: Value(unit.role.value.name),
      // Drift автоматически вызовет UnitStatsConverter.toSql
      stats: Value(unit.stats),
    );
  }
}
