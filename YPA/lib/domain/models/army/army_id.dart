/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:uuid/uuid.dart';

class ArmyId
{
    final String value;

    ArmyId._(this.value);

    factory ArmyId.generate()
    {
        return ArmyId._(const Uuid().v4());
    }

    factory ArmyId.fromString(String value)
    {
        if (value.isEmpty) 
        {
            throw ArgumentError('ArmyId cannot be empty');
        }
        return ArmyId._(value);
    }

    @override
    bool operator==(Object other) =>
    identical(this, other) || other is ArmyId && runtimeType == other.runtimeType && value == other.value;

    @override
    int get hashCode => value.hashCode;

    @override
    String toString() => value;
}
