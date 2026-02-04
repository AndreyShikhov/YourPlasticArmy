/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

class CodexName
{
    final String value;

    CodexName(this.value)
    {
        if (value.trim().isEmpty) 
        {
            throw ArgumentError('Codex name cannot be empty');
        }
    }
}
