/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'core_unit_ability_dom.dart';

abstract class CoreUnitAbilityRepository
{
    Future<List<CoreUnitAbilityDOM>> findAll();
    Future<CoreUnitAbilityDOM?> findByCode(String code);
}
