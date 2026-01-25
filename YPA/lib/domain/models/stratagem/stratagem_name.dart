/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import '../../shared/value_object.dart';

class StratagemName extends ValueObject<String>
{
    static const int maxLength = 200;

    const StratagemName._(super.value);

    factory StratagemName(String name)
    {
        final trimmed = name.trim();

        if (trimmed.isEmpty) 
        {
            throw ArgumentError('StratagemName cannot be empty');
        }

        if (trimmed.length > maxLength) 
        {
            throw ArgumentError(
                'StratagemName cannot be longer than $maxLength characters'
            );
        }

        return StratagemName._(trimmed);
    }
}
