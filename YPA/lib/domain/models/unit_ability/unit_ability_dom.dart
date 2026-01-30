/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

class UnitAbilityDOM
{
    final String id;
    final String code;
    final String name;
    final String shortDescription;
    final String description;

    const UnitAbilityDOM({
        required this.id,
        required this.code,
        required this.name,
        required this.shortDescription,
        required this.description
    });

    factory UnitAbilityDOM.empty({
        String id = '',
        String code = '',
        String name = '',
        String shortDescription = '',
        String description = ''
    })
    {
        // TODO: implement UnitAbilityDOM.empty
        throw UnimplementedError();
    }
}
