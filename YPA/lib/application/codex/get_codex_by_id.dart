/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:ypa/domain/models/codex/codex_dom.dart';
import 'package:ypa/domain/models/codex/codex_id.dart';
import 'package:ypa/domain/models/codex/codex_repository.dart';

class GetCodexById
{
    final CodexRepository repository;

    GetCodexById(this.repository);

    Future<CodexDom?> call(CodexId id)
    {
        return repository.findById(id);
    }
}
