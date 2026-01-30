/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:ypa/domain/models/unit_ability/unit_ability_dom.dart';

abstract class UnitAbilityRepository
{
    Future<List<UnitAbilityDOM>> getAllUnitAbility();
    Future<UnitAbilityDOM?> getUnitAbilityByCode(String code);
}
