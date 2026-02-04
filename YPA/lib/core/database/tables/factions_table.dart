/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:drift/drift.dart';

class Factions extends Table
{
    TextColumn get id => text()();

    /// Stable technical identifier for SQL & seeds
    TextColumn get code => text().unique().withLength(min: 1)();
    // imperium, chaos, xenos

    /// Display name (UI, localization later)
    TextColumn get name => text().withLength(min: 1)();

    @override
    Set<Column> get primaryKey => {id};
}
