/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'dart:async';

import 'package:ypa/domain/models/unit/unit.dart';

import '../../core/database/tables/seed/seed_objects/_types.dart';
import '../../domain/models/army/army.dart';
import '../../domain/models/codex/codex.dart';

class CreateUnit {
  final UnitRepository repository;

  CreateUnit(this.repository);

  Future<void> call({
    required UnitName name,
    required ArmyCodeDom armyCode,
    required CodexCodeDom? codexCode,
    required UnitRoleCodeDom role,
    required int repeat,
    required List<String> keywords,
    required List<String> factionKeywords,
    required UnitComposition unitComposition,
    required List<UnitAbilitiesCode> unitAbility,
    required List<CoreUnitAbilityCode> coreAbilities,
    required List<FactionUnitAbilityCode> factionAbilities,
    required List<String> leader,
    required List<String> ledBy,
    required Map<String, ModelStats> modelStats,
  }) async {
    final unit = UnitDOM.create(
      name: name,
      armyCode: armyCode,
      codexCode: codexCode,
      role: role,
      repeat: repeat,
      keywords: keywords,
      factionKeywords: factionKeywords,
      unitComposition: unitComposition,
      unitAbility: unitAbility,
      coreAbilities: coreAbilities,
      factionAbilities: factionAbilities,
      leader: leader,
      ledBy: ledBy,
      modelStats: modelStats,
    );

    await repository.saveUnit(unit);
  }
}
