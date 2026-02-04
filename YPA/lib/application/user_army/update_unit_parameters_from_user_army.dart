/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../../core/database/tables/seed/seed_objects/_types.dart';
import '../../domain/models/user_army/user_army.dart';

class UpdateUnitParametersFromUserArmy
{

    final UserArmyRepository repository;

    UpdateUnitParametersFromUserArmy(this.repository);

    Future<void> call({required String armyId, required String instanceId, required UnitRoleCode role, required SaveCategoryCode category, required dynamic updateData}) async
    {
        await repository.updateUnitInstanceFromUserArmy(armyId, instanceId, role, category, updateData);
    }
}
