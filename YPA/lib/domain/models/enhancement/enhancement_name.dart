/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import '../../shared/value_object.dart';

class EnhancementName extends ValueObject<String>
{
    static const int maxLength = 200;

    const EnhancementName._(super.value);

    factory EnhancementName(String name)
    {
        final trimmed = name.trim();

        if (trimmed.isEmpty) 
        {
            throw ArgumentError('EnhancementName cannot be empty');
        }

        if (trimmed.length > maxLength) 
        {
            throw ArgumentError(
                'EnhancementName cannot be longer than $maxLength characters'
            );
        }

        return EnhancementName._(trimmed);
    }
}
