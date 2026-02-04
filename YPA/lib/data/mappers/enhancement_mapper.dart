/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:drift/drift.dart';

import '../../core/database/app_database.dart';
import '../../domain/models/detachment/detachment.dart';
import '../../domain/models/enhancement/enhancement.dart';

class EnhancementMapper
{
    static EnhancementDOM fromRow(Enhancement row) 
    {
        return EnhancementDOM.restore(
            id: EnhancementId.fromString(row.id),
            code: EnhancementCode(row.code),
            name: EnhancementName(row.name),
            description: EnhancementDescription(row.description),
            detachmentId: DetachmentId.fromString(row.detachmentId.toString()),
            points: row.points
        );
    }

    static EnhancementsCompanion toCompanion(EnhancementDOM enhancement) 
    {
        return EnhancementsCompanion(
            id: Value(enhancement.id.value),
            code: Value(enhancement.code.value),
            name: Value(enhancement.name.value),
            description: Value(enhancement.description.value),
            detachmentId: Value(enhancement.detachmentId.value),
            points: Value(enhancement.points)
        );
    }
}
