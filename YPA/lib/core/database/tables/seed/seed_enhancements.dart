/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/enhancements/enhancements.dart';

import '../../app_database.dart';

Future<void> seedEnhancements(
    AppDatabase db,
    Map<String, String> detachmentIds
) async
{
    final seeds = enhancementSeed();

    for (final seed in seeds)
    {
        final detachmentCode = seed.detachmentCode.toLowerCase();

        if (!detachmentIds.containsKey(detachmentCode)) 
        {
            throw StateError(
                'Seed error: unknown detachment "$detachmentCode" for enhancement "${seed.code}"'
            );
        }

        await db.into(db.enhancements).insert(
            EnhancementsCompanion.insert(
                id: const Uuid().v4(),
                code: seed.code.toLowerCase(),
                name: seed.name,
                description: seed.description,
                detachmentId: detachmentIds[detachmentCode]!,
                points: Value(seed.points)
            ),
            mode: InsertMode.insertOrIgnore
        );
    }
}
