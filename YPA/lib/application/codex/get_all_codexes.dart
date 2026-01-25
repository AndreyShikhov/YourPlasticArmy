/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:ypa/domain/models/codex/codex.dart';

class GetAllCodexes
{
    final CodexRepository repository;

    GetAllCodexes(this.repository);

    Future<List<CodexDOM>> call() async
    {
        return await repository.findAll();
    }
}
