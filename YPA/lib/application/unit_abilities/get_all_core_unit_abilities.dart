
/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../../domain/models/abilities/core_unit_ability/core_unit_ability.dart';


class GetAllCoreUnitAbilities
{
    final CoreUnitAbilityRepository repository;

    GetAllCoreUnitAbilities(this.repository);

    Future<List<CoreUnitAbilityDOM>> call() 
    {
        return repository.getAllCoreUnitAbilities();
    }
}
