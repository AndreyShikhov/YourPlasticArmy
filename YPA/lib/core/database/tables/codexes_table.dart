/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:drift/drift.dart';

import 'armies_table.dart';

class Codexes extends Table
{
    TextColumn get id => text()();

    /// ultramarines, blood_angels
    TextColumn get code => text().unique().withLength(min: 1)();

    /// Ultramarines, Blood Angels
    TextColumn get name => text().withLength(min: 1)();

    /// Codex belongs to Army
    /// Changed to TextColumn to match Armies.id (UUID)
    TextColumn get armyId =>
    text().references(Armies, #id)();

    @override
    Set<Column> get primaryKey => {id};
}
