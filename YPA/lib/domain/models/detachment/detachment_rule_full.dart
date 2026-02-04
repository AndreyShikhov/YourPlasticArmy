/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../../shared/value_object.dart';

class DetachmentRuleFull extends ValueObject<String>
{
    static const int maxLength = 5000;

    const DetachmentRuleFull._(super.value);

    factory DetachmentRuleFull(String ruleFull)
    {
        final trimmed = ruleFull.trim();

        if (trimmed.isEmpty) 
        {
            throw ArgumentError('DetachmentRuleFull cannot be empty');
        }

        if (trimmed.length > maxLength) 
        {
            throw ArgumentError(
                'DetachmentRuleFull cannot be longer than $maxLength characters'
            );
        }

        return DetachmentRuleFull._(trimmed);
    }
}
