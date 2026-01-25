/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import '../../../core/database/tables/seed/seed_objects/_types.dart';

class UnitRoleCodeDom
{
    final UnitRoleCode value;

    const UnitRoleCodeDom._(this.value);

    /// Фабричный конструктор по enum
    factory UnitRoleCodeDom(UnitRoleCode value)
    {
        return UnitRoleCodeDom._(value);
    }

    /// Фабричный конструктор по int (например, из базы)
    factory UnitRoleCodeDom.fromInt(int id)
    {
        if (id < 0 || id >= UnitRoleCode.values.length) 
        {
            throw Exception('Invalid role id: $id');
        }
        return UnitRoleCodeDom._(UnitRoleCode.values[id]);
    }

    /// Фабричный конструктор по строке (например, для сериализации)
    factory UnitRoleCodeDom.fromString(String name)
    {
        final match = UnitRoleCode.values.firstWhere(
            (e) => e.name == name,
            orElse: () => throw Exception('Invalid role name: $name')
        );
        return UnitRoleCodeDom._(match);
    }

    /// Получить int для базы
    int toInt() => value.index;

    /// Получить строку для сериализации
    String toJson() => value.name;

    /// Получить enum
    UnitRoleCode toEnum() => value;

    @override
    bool operator==(Object other) =>
    identical(this, other) ||
        other is UnitRoleCodeDom && runtimeType == other.runtimeType && value == other.value;

    @override
    int get hashCode => value.hashCode;

    @override
    String toString() => value.name;
}

