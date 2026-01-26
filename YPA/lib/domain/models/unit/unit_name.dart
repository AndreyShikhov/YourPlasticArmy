/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

class UnitNameDom
{
    final String value;

    const UnitNameDom._(this.value);

    factory UnitNameDom(String value)
    {
        if (value.isEmpty) 
        {
            throw Exception('UnitName не может быть пустым');
        }
        return UnitNameDom._(value);
    }

    @override
    bool operator==(Object other) =>
    identical(this, other) ||
        other is UnitNameDom && runtimeType == other.runtimeType && value == other.value;

    @override
    int get hashCode => value.hashCode;
}
