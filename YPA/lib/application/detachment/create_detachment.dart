/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../../domain/models/army/army.dart';
import '../../domain/models/detachment/detachment.dart';

class CreateDetachment
{
    final DetachmentRepository repository;

    CreateDetachment(this.repository);

    Future<DetachmentDOM> call({
        required String name,
        required ArmyId armyId,
        required String dtCode,
        required String dtDescription,
        required String dtRuleName,
        required String dtRuleShort,
        required String dtRuleFull
    }) async
    {
        final all = await repository.getAllDetachment();

        final existing = all.where(
            (d) =>
            d.name.value == name &&
                d.armyId.value == armyId.value
        );

        if (existing.isNotEmpty) 
        {
            return existing.first;
        }

        final detachment = DetachmentDOM.create(
            name: DetachmentName(name),
            armyId: armyId,
            code: DetachmentCode(dtCode),
            description: DetachmentDescription(dtDescription),
            ruleName: DetachmentRuleName(dtRuleName),
            ruleShort: DetachmentRuleShort(dtRuleShort),
            ruleFull: DetachmentRuleFull(dtRuleFull)
        );

        await repository.saveDetachment(detachment);

        return detachment;
    }
}
