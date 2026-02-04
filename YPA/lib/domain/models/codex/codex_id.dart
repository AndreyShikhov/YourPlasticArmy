/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:uuid/uuid.dart';

class CodexId
{
    final String value;

    CodexId._(this.value);

    /// Генерация нового ID
    factory CodexId.generate()
    {
        final id = const Uuid().v4();
        return CodexId._(id);
    }

    factory CodexId.fromString(String value)
    {
        if (value.isEmpty) 
        {
            throw ArgumentError('CodexId cannot be empty');
        }
        return CodexId._(value);
    }

    factory CodexId.fromInt(int value)
    {
        if (value < 0) 
        {
            throw ArgumentError('CodexId cannot be < 0');
        }
        return CodexId._(value.toString());
    }

    @override
    bool operator==(Object other) => identical(this, other) || other is CodexId && other.value == value;

    @override
    int get hashCode => value.hashCode;

    int toInt() 
    {
        return int.parse(value);
    }
}
