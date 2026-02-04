/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../../domain/models/unit/unit.dart';

class GetAllUnits
{
    final UnitRepositoryDom repository;

    GetAllUnits(this.repository);

    Future<List<UnitDOM>> call() async
    {
        return await repository.findAllUnits();
    }

}
