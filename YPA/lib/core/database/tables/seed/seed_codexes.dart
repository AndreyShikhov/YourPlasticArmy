/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/codexes/codex.dart';

import '../../app_database.dart';

Future<Map<String, String>> seedCodexes(
    AppDatabase db,
    Map<String, String> armyIds // Изменено на String
) async
{
    final codexes = getAllCodexes();
    final result = <String, String>{};

    for (final c in codexes)
    {
        final codexId = const Uuid().v4();

        await db.into(db.codexes).insert(
            CodexesCompanion.insert(
                id: codexId,
                code: c.code.code,
                name: c.name,
                armyId: armyIds[c.army.code]! // Теперь это String (UUID)
            ),
            mode: InsertMode.insertOrIgnore
        );

        final existing = await (db.select(db.codexes)
        ..where((t) => t.code.equals(c.code.code)))
            .getSingleOrNull();

        if (existing != null) 
        {
            result[c.code.code] = existing.id;
        }
    }

    return result;
}
