/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'dart:async';

import 'package:ypa/domain/models/unit/unit.dart';

import '../../domain/models/army/army.dart';
import '../../domain/models/codex/codex.dart';
import '../../domain/models/unit/unit_stats.dart';

class CreateUnit
{

    final UnitRepository repository;

    CreateUnit(this.repository);

    Future<void> call({
        required UnitName name,
        required ArmyId armyId,
        required CodexId? codexId,
        required UnitRoleCodeDom role,
        required Map<String, UnitStats> stats
    }) async
    {
        final unit = UnitDOM.create(
            name: name,
            armyId: armyId,
            codexId: codexId,
            role: role,
            stats: stats
        );
        await repository.saveUnit(unit);
    }

}
