/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:drift/drift.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/detachments/detachment_codex.dart';

import '../../app_database.dart';

Future<void> seedCodexDetachments(
    AppDatabase db,
    Map<String, String> detachmentIds,
    Map<String, String> codexIds
) async
{
    final links = detachmentsCodex();

    for (final link in links)
    {
        final detachmentCode = link.detachmentCode.toLowerCase();
        final codexCode = link.codex.code.toLowerCase();

        if (!detachmentIds.containsKey(detachmentCode)) 
        {
            throw StateError(
                'Seed error: unknown detachment "$detachmentCode"'
            );
        }

        if (!codexIds.containsKey(codexCode)) 
        {
            throw StateError(
                'Seed error: unknown codex "$codexCode"'
            );
        }

        await db.into(db.codexDetachments).insert(
            CodexDetachmentsCompanion.insert(
                codexId: codexIds[codexCode]!,
                detachmentId: detachmentIds[detachmentCode]!,
                isGeneral: Value(link.isGeneral)
            ),
            mode: InsertMode.insertOrIgnore
        );
    }
}
