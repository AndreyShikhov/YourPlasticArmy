/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/application/unit_abilities/get_all_unit_abilities.dart';
import 'package:ypa/core/database/database_providers.dart';
import 'package:ypa/data/repositories/drift_unit_ability_repository.dart';

import '../../../application/unit_abilities/get_unit_bility_by_code.dart';
import '../../../domain/models/abilities/unit_ability/unit_ability.dart';

// --- REPOSITORIES ---

final unitAbilityRepositoryProvider = Provider<UnitAbilityRepository>((ref)
    {
        final db = ref.watch(databaseProvider).requireValue;
        return DriftUnitAbilityRepository(db);
    });

// --- USE CASES ---

final getAllUnitAbilitiesUseCaseProvider = Provider<GetAllUnitAbilities>((ref)
    {
        final repository = ref.watch(unitAbilityRepositoryProvider);
        return GetAllUnitAbilities(repository);
    });

final getunitAbilityByCodeUseCaseProvider = Provider<GetUnitAbilityByCode>((ref)
    {
        final repository = ref.watch(unitAbilityRepositoryProvider);
        return GetUnitAbilityByCode(repository);
    });


// --- UI STATE ---

final unitAbilitiesListProvider = FutureProvider<List<UnitAbilityDOM>>((ref) async
    {
        final useCase = ref.watch(getAllUnitAbilitiesUseCaseProvider);
        return useCase();
    });
