/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:ypa/domain/models/role/role.dart';

class RoleDOM
{
    final RoleId id;
    final RoleCode code;
    final RoleName name;

    const RoleDOM._({
        required this.id,
        required this.code,
        required this.name
    });

    factory RoleDOM.create({
        required RoleCode code,
        required RoleName name
    })
    {
        return RoleDOM._(
            id: RoleId.generate(), // Генерируем UUID при создании роли
            code: code,
            name: name
        );
    }

    factory RoleDOM.restore({
        required RoleId id,
        required RoleCode code,
        required RoleName name
    })
    {
        return RoleDOM._(
            id: id,
            code: code,
            name: name
        );
    }
}
