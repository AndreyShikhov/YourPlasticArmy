/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../../domain/models/abilities/core_unit_ability/core_unit_ability.dart';





class GetCoreUnitAbilityByCode {
  final CoreUnitAbilityRepository repository;

  GetCoreUnitAbilityByCode(this.repository);

  Future<CoreUnitAbilityDOM?> call(String code)
  {
    return repository.getCoreUnitAbilityByCode(code);
  }
}
