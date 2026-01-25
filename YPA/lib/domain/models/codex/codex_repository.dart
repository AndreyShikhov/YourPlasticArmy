/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import '../army/army_id.dart';
import 'codex_dom.dart';
import 'codex_id.dart';

abstract class CodexRepository
{
    Future<void> save(CodexDOM codex);
    Future<CodexDOM?> findById(CodexId id);
    Future<List<CodexDOM>> findAll();
    Future<List<CodexDOM>> findByArmy(ArmyId armyId);
    Future<void> delete(CodexId id);
}
