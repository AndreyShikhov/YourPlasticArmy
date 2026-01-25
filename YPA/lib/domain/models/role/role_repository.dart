/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'role_dom.dart';
import 'role_id.dart';

abstract class RoleRepository
{
    Future<void> save(RoleDOM role);
    Future<RoleDOM?> findById(RoleId id);
    Future<List<RoleDOM>> findAll();
    Future<void> delete(RoleId id);
}
