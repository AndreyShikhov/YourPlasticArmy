/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import '../../shared/value_object.dart';

class EnhancementCode extends ValueObject<String>
{
    static const int maxLength = 100;

    const EnhancementCode._(super.value);

    factory EnhancementCode(String code)
    {
        final trimmed = code.trim().toLowerCase();

        if (trimmed.isEmpty) 
        {
            throw ArgumentError('EnhancementCode cannot be empty');
        }

        if (trimmed.length > maxLength) 
        {
            throw ArgumentError(
                'EnhancementCode cannot be longer than $maxLength characters'
            );
        }

        // Проверяем, что код содержит только буквы, цифры и подчёркивания
        if (!RegExp(r'^[a-z0-9_]+$').hasMatch(trimmed)) 
        {
            throw ArgumentError(
                'EnhancementCode can only contain lowercase letters, numbers and underscores'
            );
        }

        return EnhancementCode._(trimmed);
    }
}
