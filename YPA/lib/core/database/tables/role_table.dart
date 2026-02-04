/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:drift/drift.dart';

class Role extends Table
{
    TextColumn get id => text()();

    /// hq, troops, elite, fast_attack
    TextColumn get code => text().unique().withLength(min: 1)();

    /// HQ, Troops, Elite
    TextColumn get name => text().withLength(min: 1)();

    @override
    Set<Column> get primaryKey => {id};
}
