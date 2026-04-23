/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/application/weapon_abilities/get_all_weapon_abilities.dart';
import 'package:ypa/core/database/database_providers.dart';
import 'package:ypa/data/repositories/repositories.dart';

import '../../../domain/models/abilities/weapon_ability/weapon_ability.dart';

// --- REPOSITORIES ---

final weaponAbilityRepositoryProvider = Provider<WeaponAbilityRepository>((ref)
    {
        final db = ref.watch(databaseProvider).requireValue;
        return DriftWeaponAbilityRepository(db);
    });

// --- USE CASES ---

final getAllWeaponAbilitiesUseCaseProvider = Provider<GetAllWeaponAbilities>((ref)
    {
        final repository = ref.watch(weaponAbilityRepositoryProvider);
        return GetAllWeaponAbilities(repository);
    });

// --- UI STATE ---

final weaponAbilitiesListProvider = FutureProvider<List<WeaponAbilityDOM>>((ref) async
    {
        final useCase = ref.watch(getAllWeaponAbilitiesUseCaseProvider);
        return useCase();
    });
