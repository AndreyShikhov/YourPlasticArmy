/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:uuid/uuid.dart';

class RoleId
{
    final String value;

    const RoleId._(this.value);

    factory RoleId.generate()
    {
        return RoleId._(const Uuid().v4());
    }

    factory RoleId.fromString(String value)
    {
        if (value.isEmpty) 
        {
            throw ArgumentError('RoleId cannot be empty');
        }
        return RoleId._(value);
    }

    @override
    bool operator==(Object other) =>
    identical(this, other) ||
        other is RoleId && runtimeType == other.runtimeType && value == other.value;

    @override
    int get hashCode => value.hashCode;

    @override
    String toString() => value;
}
