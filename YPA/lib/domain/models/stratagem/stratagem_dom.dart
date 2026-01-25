/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:uuid/uuid.dart';
import 'package:ypa/domain/models/stratagem/strategem.dart';

import '../codex/codex.dart';
import '../detachment/detachment.dart';

class StratagemDOM
{
    final StratagemId id;
    final StratagemCode code;
    final StratagemName name;
    final StratagemWhen when;
    final StratagemTarget target;
    final StratagemEffect effect; // Теперь это объект
    final int cost;
    final CodexId codexId;
    final DetachmentId? detachmentId;

    const StratagemDOM._({
        required this.id,
        required this.code,
        required this.name,
        required this.when,
        required this.target,
        required this.effect,
        required this.cost,
        required this.codexId,
        this.detachmentId
    });

    factory StratagemDOM.create({
        required StratagemCode code,
        required StratagemName name,
        required StratagemWhen when,
        required StratagemTarget target,
        required StratagemEffect effect,
        required int cost,
        required CodexId codexId,
        DetachmentId? detachmentId
    })
    {
        return StratagemDOM._(
            id: StratagemId.fromString(const Uuid().v4()),
            code: code,
            name: name,
            when: when,
            target: target,
            effect: effect,
            cost: cost,
            codexId: codexId,
            detachmentId: detachmentId
        );
    }

    factory StratagemDOM.restore({
        required StratagemId id,
        required StratagemCode code,
        required StratagemName name,
        required StratagemWhen when,
        required StratagemTarget target,
        required StratagemEffect effect,
        required int cost,
        required CodexId codexId,
        DetachmentId? detachmentId
    })
    {
        return StratagemDOM._(
            id: id,
            code: code,
            name: name,
            when: when,
            target: target,
            effect: effect,
            cost: cost,
            codexId: codexId,
            detachmentId: detachmentId
        );
    }
}
