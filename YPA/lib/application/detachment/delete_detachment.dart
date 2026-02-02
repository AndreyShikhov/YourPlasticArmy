/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import '../../domain/models/army/army.dart';
import '../../domain/models/detachment/detachment.dart';

class UpdateDetachment
{
    final DetachmentRepository repository;

    UpdateDetachment(this.repository);

    Future<DetachmentDOM> call({
        required String id,
        required String name,
        required ArmyId armyId,
        required String dtCode,
        required String dtDescription,
        required String dtRuleName,
        required String dtRuleShort,
        required String dtRuleFull
    }) async
    {
        final detachmentId = DetachmentId.fromString(id);

        final existing =
            await repository.getDetachmentById(detachmentId);

        if (existing == null) 
        {
            throw StateError('Detachment not found');
        }

        final updated = DetachmentDOM.restore(
            id: existing.id,
            armyId: armyId,
            name: DetachmentName(name),
            code: DetachmentCode(dtCode),
            description: DetachmentDescription(dtDescription),
            ruleName: DetachmentRuleName(dtRuleName),
            ruleShort: DetachmentRuleShort(dtRuleShort),
            ruleFull: DetachmentRuleFull(dtRuleFull)
        );

        await repository.saveDetachment(updated);

        return updated;
    }
}
