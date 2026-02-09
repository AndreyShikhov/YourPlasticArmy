/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */



import '../../domain/models/abilities/weapon_ability/weapon_ability.dart';

class GetAllWeaponAbilities
{
    final WeaponAbilityRepository repository;

    GetAllWeaponAbilities(this.repository);

    Future<List<WeaponAbilityDOM>> call() 
    {
        return repository.getAllWeaponAbility();
    }
}
