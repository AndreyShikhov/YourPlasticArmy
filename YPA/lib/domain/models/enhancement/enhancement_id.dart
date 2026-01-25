/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:uuid/uuid.dart';

class EnhancementId
{
    final String value;

    const EnhancementId._(this.value);

    factory EnhancementId.generate()
    {
        final id = const Uuid().v4();
        return EnhancementId._(id);
    }

    factory EnhancementId.fromString(String value)
    {
        if (value.isEmpty) 
        {
            throw ArgumentError('EnhancementId cannot be empty');
        }
        return EnhancementId._(value);
    }

    @override
    bool operator==(Object other) =>
    identical(this, other) ||
        other is EnhancementId && runtimeType == other.runtimeType && value == other.value;

    @override
    int get hashCode => value.hashCode;

    @override
    String toString() => value;
}
