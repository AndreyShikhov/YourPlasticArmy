/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:uuid/uuid.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/factions/factions.dart';

import '../../app_database.dart';

Future<Map<String, String>> seedFactions(AppDatabase db) async
{
    final data = getAllFactions();
    final result = <String, String>{};

    for (final faction in data)
    {
        final code = faction.code.code; 

        final existing = await (db.select(db.factions)
        ..where((tbl) => tbl.code.equals(code)))
            .getSingleOrNull();

        String id;
        if (existing != null) 
        {
            id = existing.id;
        } else 
        {
            id = const Uuid().v4();
            await db.into(db.factions).insert(
                FactionsCompanion.insert(
                    id: id,
                    code: code,
                    name: faction.code.title
                )
            );
        }

        result[code] = id;
    }

    return result;
}
