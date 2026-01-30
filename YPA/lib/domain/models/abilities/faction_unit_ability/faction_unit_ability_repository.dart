/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'faction_unit_ability_dom.dart';

abstract class FactionUnitAbilityRepository
{
    Future<List<FactionUnitAbilityDOM>> getAllFactionUnitAbilities();
    Future<FactionUnitAbilityDOM?> getFactionUnitAbilityByCode(String code);
}
