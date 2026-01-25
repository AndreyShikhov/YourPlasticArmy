/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import '../../shared/value_object.dart';

class RoleCode extends ValueObject<String>
{
    static const int maxLength = 50;

    const RoleCode._(super.value);

    factory RoleCode(String code)
    {
        final trimmed = code.trim().toLowerCase();

        if (trimmed.isEmpty) 
        {
            throw ArgumentError('RoleCode cannot be empty');
        }

        if (trimmed.length > maxLength) 
        {
            throw ArgumentError(
                'RoleCode cannot be longer than $maxLength characters'
            );
        }

        // Проверяем, что код содержит только буквы, цифры и подчёркивания
        if (!RegExp(r'^[a-z0-9_]+$').hasMatch(trimmed)) 
        {
            throw ArgumentError(
                'RoleCode can only contain lowercase letters, numbers and underscores'
            );
        }

        return RoleCode._(trimmed);
    }
}
