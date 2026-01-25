/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:ypa/domain/models/codex/codex.dart';
import 'package:ypa/domain/models/stratagem/strategem.dart';

class GetStratagemsByCodex
{
    final StratagemRepository repository;

    GetStratagemsByCodex(this.repository);

    Future<List<StratagemDOM>> call(CodexId codexId) async
    {
        return await repository.findStratagemsByCodex(codexId);
    }
}
