/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

class StratagemWhen
{
    final String value;

    const StratagemWhen(this.value);

    @override
    bool operator==(Object other) =>
    identical(this, other) ||
        other is StratagemWhen && runtimeType == other.runtimeType && value == other.value;

    @override
    int get hashCode => value.hashCode;

    @override
    String toString() => value;
}
