/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:ypa/domain/models/weapon_ability/weapon_ability_dom.dart';
import 'package:ypa/domain/models/weapon_ability/weapon_ability_repository.dart';

class GetAllWeaponAbilities
{
    final WeaponAbilityRepository repository;

    GetAllWeaponAbilities(this.repository);

    Future<List<WeaponAbilityDOM>> call() 
    {
        return repository.findAll();
    }
}
