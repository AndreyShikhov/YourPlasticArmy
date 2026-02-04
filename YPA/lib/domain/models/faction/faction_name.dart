/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../../shared/value_object.dart';

class FactionName extends ValueObject<String>
{
    static const int maxLength = 100;

    const FactionName._(super.value);

    factory FactionName(String name)
    {
        final trimmed = name.trim();

        if (trimmed.isEmpty) 
        {
            throw ArgumentError('FactionName cannot be empty');
        }

        if (trimmed.length > maxLength) 
        {
            throw ArgumentError(
                'FactionName cannot be longer than $maxLength characters'
            );
        }

        return FactionName._(trimmed);
    }
}
