/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../../shared/value_object.dart';

class StratagemCode extends ValueObject<String>
{
    const StratagemCode._(super.value);

    factory StratagemCode(String value)
    {

        final processedValue = value.trim();

        if (processedValue.isEmpty) 
        {
            throw ArgumentError('StratagemCode cannot be empty');
        }

        return StratagemCode._(processedValue);
    }
}
