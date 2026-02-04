/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:drift/drift.dart';
import 'package:ypa/core/database/app_database.dart';

import '../../domain/models/army/army.dart';
import '../../domain/models/codex/codex.dart';

class CodexMapper
{
    static CodexDom fromRow(Codexe row)
    {
        return CodexDom.restore(
            id: CodexId.fromString(row.id),
            code: CodexCodeDom(row.code),
            armyId: ArmyId.fromString(row.armyId),
            name: CodexName(row.name)
        );
    }

    static CodexesCompanion toCompanion(CodexDom codex)
    {
        return CodexesCompanion(
            id: Value(codex.id.value),
            code: Value(codex.code.value),
            name: Value(codex.name.value),
            armyId: Value(codex.armyId.value)
        );
    }
}
