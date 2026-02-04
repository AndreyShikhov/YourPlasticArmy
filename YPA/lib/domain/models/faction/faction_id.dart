/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:uuid/uuid.dart';

class FactionId
{
    final String value;

    const FactionId._(this.value);

    factory FactionId.generate()
    {
        return FactionId._(const Uuid().v4());
    }

    factory FactionId.fromString(String value)
    {
        if (value.isEmpty) 
        {
            throw ArgumentError('FactionId cannot be empty');
        }
        return FactionId._(value);
    }

    @override
    bool operator==(Object other) =>
    identical(this, other) ||
        other is FactionId && runtimeType == other.runtimeType && value == other.value;

    @override
    int get hashCode => value.hashCode;

    @override
    String toString() => value;
}
