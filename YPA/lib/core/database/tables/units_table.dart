/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/
import 'package:drift/drift.dart';

import '../converters/unit_stats_converter.dart';
import 'armies_table.dart';
import 'codexes_table.dart';

@DataClassName('UnitRow')
class Units extends Table
{
    TextColumn get id => text()();

    TextColumn get name => text().withLength(min: 1)();

    /// Always required
    TextColumn get armyId =>
    text().references(Armies, #id)();

    /// Nullable (orks, demons, etc.)
    TextColumn get codexId =>
    text().nullable().references(Codexes, #id)();

    /// Changed to TextColumn to match Role.id (UUID)
    TextColumn get roleCode => text()();

    /// Stats stored as JSON
    TextColumn get unitStats => text().map(const UnitStatsConverter())();

    @override
    Set<Column> get primaryKey => {id};
}
