/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../../domain/models/abilities/faction_unit_ability/faction_unit_ability.dart';


class GetFactionsUnitAbilityByCode
{
  final FactionUnitAbilityRepository repository;

  GetFactionsUnitAbilityByCode(this.repository);

  Future<FactionUnitAbilityDOM?> call(String code)
  {
    return repository.getFactionUnitAbilityByCode(code);
  }
}
