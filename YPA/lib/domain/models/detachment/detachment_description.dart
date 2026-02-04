/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../../shared/value_object.dart';

class DetachmentDescription extends ValueObject<String>
{
    static const int maxLength = 2000;

    const DetachmentDescription._(super.value);

    factory DetachmentDescription(String description)
    {
        final trimmed = description.trim();

        if (trimmed.isEmpty) 
        {
            throw ArgumentError('DetachmentDescription cannot be empty');
        }

        if (trimmed.length > maxLength) 
        {
            throw ArgumentError(
                'DetachmentDescription cannot be longer than $maxLength characters'
            );
        }

        return DetachmentDescription._(trimmed);
    }
}
