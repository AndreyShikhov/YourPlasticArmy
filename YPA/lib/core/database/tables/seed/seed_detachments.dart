/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/detachments/detachments.dart';

import '../../app_database.dart';

Future<Map<String, String>> seedDetachments(
    AppDatabase db,
    Map<String, String> armyIds
) async
{
    final detachments = detachmentsBase();
    final result = <String, String>{};

    for (final d in detachments)
    {
        final detachmentId = const Uuid().v4();

        // Получаем UUID армии, используя armyCode из DetachmentSeed
        final currentArmyId = armyIds[d.armyCode.code];

        if (currentArmyId == null) 
        {
            throw StateError(
                'Seed error: unknown army code "${d.armyCode.code}" for detachment "${d.name}"'
            );
        }

        await db.into(db.detachments).insert(
            DetachmentsCompanion.insert(
                id: detachmentId,
                code: d.code,
                name: d.name,
                description: d.description,
                ruleName: d.ruleName,
                ruleShort: d.ruleShort,
                ruleFull: d.ruleFull,
                armyId: currentArmyId // Теперь привязывается к правильной фракции (в т.ч. Оркам)
            ),
            mode: InsertMode.insertOrIgnore
        );

        final existing = await (db.select(db.detachments)
        ..where((t) => t.code.equals(d.code)))
            .getSingleOrNull();

        if (existing != null) 
        {
            result[d.code] = existing.id;
        }
    }

    return result;
}
