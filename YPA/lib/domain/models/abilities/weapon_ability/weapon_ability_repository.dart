/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */




import 'package:ypa/domain/models/abilities/weapon_ability/weapon_ability_dom.dart';

abstract class WeaponAbilityRepository
{
  Future<List<WeaponAbilityDOM>> getAllWeaponAbility();
  Future<WeaponAbilityDOM?> getWeaponAbilityByCode(String code);
}