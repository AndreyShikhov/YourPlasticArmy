/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../../shared/value_object.dart';

class DetachmentName extends ValueObject<String>
{
    static const int maxLength = 100;

    const DetachmentName._(super.value);

    factory DetachmentName(String name)
    {
        final trimmed = name.trim();

        if (trimmed.isEmpty) 
        {
            throw ArgumentError('DetachmentName cannot be empty');
        }

        if (trimmed.length > maxLength) 
        {
            throw ArgumentError(
                'DetachmentName cannot be longer than $maxLength characters'
            );
        }

        return DetachmentName._(trimmed);
    }
}
