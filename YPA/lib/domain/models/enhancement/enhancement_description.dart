/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../../shared/value_object.dart';

class EnhancementDescription extends ValueObject<String>
{
    static const int maxLength = 2000;

    const EnhancementDescription._(super.value);

    factory EnhancementDescription(String description)
    {
        final trimmed = description.trim();

        if (trimmed.isEmpty) 
        {
            throw ArgumentError('EnhancementDescription cannot be empty');
        }

        if (trimmed.length > maxLength) 
        {
            throw ArgumentError(
                'EnhancementDescription cannot be longer than $maxLength characters'
            );
        }

        return EnhancementDescription._(trimmed);
    }
}
