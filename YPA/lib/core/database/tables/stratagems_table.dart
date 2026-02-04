/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:drift/drift.dart';

import 'codexes_table.dart';
import 'detachments_table.dart';

class Stratagems extends Table
{
    TextColumn get id => text()();
    TextColumn get code => text()();
    TextColumn get name => text()();
    TextColumn get when => text()();
    TextColumn get target => text()();
    TextColumn get effect => text()();
    IntColumn get cost => integer()();

    /// FK → Codex (optional for core stratagems)
    TextColumn get codexId => text().nullable().references(Codexes, #id)();

    /// FK → Detachment (optional)
    TextColumn get detachmentId => text().nullable().references(Detachments, #id)();

    @override
    Set<Column> get primaryKey => {id};
}
