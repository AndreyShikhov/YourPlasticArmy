
/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

class UnitIdDom
{
    final String value;

    const UnitIdDom._(this.value);

    /// Создать UnitId из строки
    factory UnitIdDom.fromString(String value)
    {
        if (value.isEmpty) 
        {
            throw Exception('UnitId не может быть пустым');
        }
        // Можно добавить проверку на корректный UUID, если нужно
        return UnitIdDom._(value);
    }

    @override
    bool operator==(Object other) =>
    identical(this, other) ||
        other is UnitIdDom && runtimeType == other.runtimeType && value == other.value;

    @override
    int get hashCode => value.hashCode;

    @override
    String toString() => value;
}

