/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:drift/drift.dart';

import '../../core/database/app_database.dart';
import '../../domain/models/army/army_id.dart'; // Добавлен импорт
import '../../domain/models/codex/codex_code.dart';
import '../../domain/models/unit/unit.dart';

class UnitMapper {
  static UnitDOM fromRow(UnitRow row) {
    final stats = row.unitStats;

    return UnitDOM.restore(
      id: UnitId.fromString(row.id),
      name: UnitName(row.name),
      armyId: ArmyId.fromString(row.armyId),
      codexCode: row.codexId != null ? CodexCodeDom.fromString(row.codexId!) : null,
      role: UnitRoleCodeDom.fromString(row.roleCode).toEnum(),
      repeat: stats.repeat,
      keywords: stats.keywords,
      factionKeywords: stats.factionKeywords,
      unitComposition: stats.unitComposition,
      unitAbility: stats.unitAbility,
      coreAbilities: stats.coreAbilities,
      factionAbilities: stats.factionAbilities,
      leader: stats.leader,
      ledBy: stats.ledBy,
      modelStats: stats.modelStats,
    );
  }

  static UnitsCompanion toCompanion(UnitDOM unit) {
    final statsWrapper = UnitStats(
      repeat: unit.repeat,
      keywords: unit.keywords,
      factionKeywords: unit.factionKeywords,
      unitComposition: unit.unitComposition,
      unitAbility: unit.unitAbility,
      coreAbilities: unit.coreAbilities,
      factionAbilities: unit.factionAbilities,
      leader: unit.leader,
      ledBy: unit.ledBy,
      modelStats: unit.modelStats,
    );

    return UnitsCompanion(
      id: Value(unit.id.value),
      name: Value(unit.name.value),
      // Сохраняем значение ID армии
      armyId: Value(unit.armyId.value),
      codexId: unit.codexCode != null 
          ? Value(unit.codexCode!.value)
          : const Value.absent(),
      roleCode: Value(unit.role.value.name),
      unitStats: Value(statsWrapper),
    );
  }
}
