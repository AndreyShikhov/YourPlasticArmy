/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../../shared/value_object.dart';

class DetachmentRuleName extends ValueObject<String>
{
    static const int maxLength = 200;

    const DetachmentRuleName._(super.value);

    factory DetachmentRuleName(String ruleName)
    {
        final trimmed = ruleName.trim();

        if (trimmed.isEmpty) 
        {
            throw ArgumentError('DetachmentRuleName cannot be empty');
        }

        if (trimmed.length > maxLength) 
        {
            throw ArgumentError(
                'DetachmentRuleName cannot be longer than $maxLength characters'
            );
        }

        return DetachmentRuleName._(trimmed);
    }
}
