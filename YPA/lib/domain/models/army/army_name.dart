/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../../shared/value_object.dart';

class ArmyName extends ValueObject<String>
{
    static const int maxLength = 100;

    const ArmyName._(super.value);

    factory ArmyName(String name)
    {
        final trimmed = name.trim();

        if (trimmed.isEmpty) 
        {
            throw ArgumentError('ArmyName cannot be empty');
        }

        if (trimmed.length > maxLength) 
        {
            throw ArgumentError('ArmyName cannot be longer than $maxLength characters');
        }

        return ArmyName._(trimmed);
    }
}
