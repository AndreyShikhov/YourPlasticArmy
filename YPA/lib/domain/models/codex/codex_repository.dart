/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../army/army_id.dart';
import 'codex_dom.dart';
import 'codex_id.dart';

abstract class CodexRepository
{
    Future<void> save(CodexDom codex);
    Future<CodexDom?> findById(CodexId id);
    Future<List<CodexDom>> findAll();
    Future<List<CodexDom>> findByArmy(ArmyId armyId);
    Future<void> delete(CodexId id);
}
