/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import '../../domain/models/army/army.dart';
import '../../domain/models/unit/unit.dart';

class GetUnitsByArmy
{
    final UnitRepository repository;

    GetUnitsByArmy(this.repository);

    Future<List<UnitDOM>> call(ArmyId armyId) async
    {
        return await repository.findUnitsByArmy(armyId);
    }
}
