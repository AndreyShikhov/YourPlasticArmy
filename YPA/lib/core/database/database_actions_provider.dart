/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_database.dart';
import 'database_providers.dart';

final databaseActionsProvider = Provider<DatabaseActions>((ref)
    {
        final dbAsync = ref.watch(databaseProvider);

        return DatabaseActions(ref, dbAsync);
    });

class DatabaseActions
{
    DatabaseActions(this.ref, this.dbAsync);

    final Ref ref;
    final AsyncValue<AppDatabase> dbAsync;

    Future<AppDatabase> get _db async
    {
        return dbAsync.requireValue;
    }

    Future<void> clearDatabase() async
    {
        final db = await _db;
        await db.clearDatabase();
    }

    Future<void> seedDatabase() async
    {
        final db = await _db;
        await db.seedDatabase();
    }

    Future<void> resetDatabase() async
    {
        final db = await _db;
        await db.resetDatabase();
    }
}
