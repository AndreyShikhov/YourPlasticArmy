/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import '../../domain/models/abilities/unit_ability/unit_ability.dart';

class GetAllUnitAbilities
{
    final UnitAbilityRepository repository;

    GetAllUnitAbilities(this.repository);

    Future<List<UnitAbilityDOM>> call() 
    {
        return repository.getAllUnitAbility();
    }
}
