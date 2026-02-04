/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:drift/drift.dart';

import '../../core/database/app_database.dart';
import '../../domain/models/army/army_id.dart';
import '../../domain/models/codex/codex_id.dart';
import '../../domain/models/unit/unit.dart';

class UnitMapper {
  static UnitDOM fromRow(UnitRow row) {
    // row.unitStats уже имеет тип UnitStatsDom благодаря UnitStatsConverter
    final stats = row.unitStats;

    return UnitDOM.restore(
      id: UnitIdDom.fromString(row.id),
      name: UnitNameDom(row.name),
      armyId: ArmyId.fromString(row.armyId),
      codexId: row.codexId != null ? CodexId.fromString(row.codexId!) : null,
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
      modelStats: stats.modelStats, // Передаем Map<String, ModelStatsDom>
    );
  }

  static UnitsCompanion toCompanion(UnitDOM unit) {
    // Упаковываем все поля UnitDOM обратно в контейнер UnitStatsDom для сохранения в одну JSON колонку
    final statsWrapper = UnitStatsDom(
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
      armyId: Value(unit.armyId.value),
      codexId: unit.codexId != null 
          ? Value(unit.codexId!.value) 
          : const Value.absent(),
      // Сохраняем код роли (например, 'characters'), а не заголовок
      roleCode: Value(unit.role.value.name),
      unitStats: Value(statsWrapper),
    );
  }
}
