/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/


import '../../domain/models/abilities/unit_ability/unit_ability.dart';




class GetUnitAbilityByCode
{
  final UnitAbilityRepository repository;

  GetUnitAbilityByCode(this.repository);

  Future<UnitAbilityDOM?> call(String code)
  {
    return repository.getUnitAbilityByCode(code);
  }
}
