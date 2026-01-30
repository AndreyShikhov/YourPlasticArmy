/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/application/unit_abilities/get_all_core_unit_abilities.dart';
import 'package:ypa/core/database/database_providers.dart';

import '../../../application/unit_abilities/get_core_unit_ability_by_code.dart';
import '../../../data/repositories/drift_core_unit_ability_repository.dart';
import '../../../domain/models/abilities/core_unit_ability/core_unit_ability.dart';

// --- CORE ABILITIES ---

final coreUnitAbilityRepositoryProvider = Provider<CoreUnitAbilityRepository>((ref)
    {
        final db = ref.watch(databaseProvider).requireValue;
        return DriftCoreUnitAbilityRepository(db);
    });

final getAllCoreUnitAbilitiesUseCaseProvider = Provider<GetAllCoreUnitAbilities>((ref)
    {
        final repository = ref.watch(coreUnitAbilityRepositoryProvider);
        return GetAllCoreUnitAbilities(repository);
    });

final getCoreUnitAbilityByCodeUseCaseProvider = Provider<GetCoreUnitAbilityByCode>((ref)
    {
        final repository = ref.watch(coreUnitAbilityRepositoryProvider);
        return GetCoreUnitAbilityByCode(repository);
    });


final coreUnitAbilitiesListProvider = FutureProvider<List<CoreUnitAbilityDOM>>((ref) async
    {
        final useCase = ref.watch(getAllCoreUnitAbilitiesUseCaseProvider);
        return useCase();
    });
