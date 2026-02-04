/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:drift/drift.dart';

@DataClassName('FactionUnitAbilityRow')
class FactionUnitAbilities extends Table
{
    TextColumn get id => text()();
    TextColumn get code => text().unique()();
    TextColumn get name => text()();
    TextColumn get shortDescription => text()();
    TextColumn get description => text()();

    @override
    Set<Column> get primaryKey => {id};
}
