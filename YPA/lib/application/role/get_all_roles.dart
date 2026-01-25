/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:ypa/domain/models/role/role.dart';

class GetAllRoles
{
    final RoleRepository repository;

    GetAllRoles(this.repository);

    Future<List<RoleDOM>> call() async
    {
        return await repository.findAll();
    }
}
