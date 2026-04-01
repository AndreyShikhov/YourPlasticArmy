
/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../detachment/detachment.dart';
import 'enhancement.dart';

class EnhancementDOM
{
    final EnhancementId id;
    final EnhancementCode code;
    final EnhancementName name;
    final EnhancementDescription description;
    final DetachmentId detachmentId;
    final int points;

    const EnhancementDOM._({
        required this.id,
        required this.code,
        required this.name,
        required this.description,
        required this.detachmentId,
        required this.points
    });

    const EnhancementDOM({
        required this.id,
        required this.code,
        required this.name,
        required this.description,
        required this.detachmentId,
        required this.points
    });

    factory EnhancementDOM.create({
        required EnhancementCode code,
        required EnhancementName name,
        required EnhancementDescription description,
        required DetachmentId detachmentId,
        int points = 0
    })
    {
        if (points < 0)
        {
            throw ArgumentError('points cannot be negative');
        }

        return EnhancementDOM._(
            id: EnhancementId.generate(),
            code: code,
            name: name,
            description: description,
            detachmentId: detachmentId,
            points: points
        );
    }

    factory EnhancementDOM.restore({
        required EnhancementId id,
        required EnhancementCode code,
        required EnhancementName name,
        required EnhancementDescription description,
        required DetachmentId detachmentId,
        required int points
    })
    {
        return EnhancementDOM._(
            id: id,
            code: code,
            name: name,
            description: description,
            detachmentId: detachmentId,
            points: points
        );
    }

    Map<String, dynamic> toJson() =>
    {
        'id': id.value,
        'Code': code.value,
        'Name': name.value,
        'Enhancement Description': description.value,
        'Detachment Id': detachmentId,
        'Points': points
    };

    factory EnhancementDOM.fromJson(Map<String, dynamic> json)
    {
        return EnhancementDOM(
            id: EnhancementId.fromString(json['id'] as String? ?? ''),
            code: EnhancementCode.fromString(json['Code'] as String? ?? ''),
            name: EnhancementName.fromString(json['Name'] as String? ?? ''),
            description: EnhancementDescription.fromString(json['Enhancement Description'] as String? ?? ''),
            detachmentId: DetachmentId.fromString(json['Detachment Id'] as String? ?? ''),
            points: json['Points'] as int? ?? 0
        );
    }
}
