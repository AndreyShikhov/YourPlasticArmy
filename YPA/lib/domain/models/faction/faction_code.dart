/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import '../../shared/value_object.dart';

class FactionCode extends ValueObject<String>
{
    static const int maxLength = 50;

    const FactionCode._(super.value);

    factory FactionCode(String code)
    {
        final trimmed = code.trim().toLowerCase();

        if (trimmed.isEmpty) 
        {
            throw ArgumentError('FactionCode cannot be empty');
        }

        if (trimmed.length > maxLength) 
        {
            throw ArgumentError(
                'FactionCode cannot be longer than $maxLength characters'
            );
        }

        // Проверяем, что код содержит только буквы, цифры и подчёркивания
        if (!RegExp(r'^[a-z0-9_]+$').hasMatch(trimmed)) 
        {
            throw ArgumentError(
                'FactionCode can only contain lowercase letters, numbers and underscores'
            );
        }

        return FactionCode._(trimmed);
    }
}
