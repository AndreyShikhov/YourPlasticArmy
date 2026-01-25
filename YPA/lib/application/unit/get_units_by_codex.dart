/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:ypa/domain/models/codex/codex.dart';

import '../../domain/models/unit/unit.dart';

class GetAllUnitsByCodexId
{
    final UnitRepository repository;

    GetAllUnitsByCodexId(this.repository);

    Future<List<UnitDOM>> call(CodexId codexId) async
    {
        return await repository.findUnitsByCodex(codexId);
    }
}
