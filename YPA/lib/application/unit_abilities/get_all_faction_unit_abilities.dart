/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../../domain/models/abilities/faction_unit_ability/faction_unit_ability.dart';


class GetAllFactionUnitAbilities
{
    final FactionUnitAbilityRepository repository;

    GetAllFactionUnitAbilities(this.repository);

    Future<List<FactionUnitAbilityDOM>> call() 
    {
        return repository.getAllFactionUnitAbilities();
    }
}
