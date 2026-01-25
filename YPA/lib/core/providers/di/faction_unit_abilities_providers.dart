/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/application/unit_abilities/get_all_faction_unit_abilities.dart';
import 'package:ypa/core/database/database_providers.dart';
import 'package:ypa/data/repositories/drift_faction_unit_ability_repository.dart';

import '../../../domain/models/faction_unit_ability/faction_unit_ability.dart';

// --- FACTION ABILITIES ---

final factionUnitAbilityRepositoryProvider = Provider<FactionUnitAbilityRepository>((ref)
    {
        final db = ref.watch(databaseProvider).requireValue;
        return DriftFactionUnitAbilityRepository(db);
    });

final getAllFactionUnitAbilitiesUseCaseProvider = Provider<GetAllFactionUnitAbilities>((ref)
    {
        final repository = ref.watch(factionUnitAbilityRepositoryProvider);
        return GetAllFactionUnitAbilities(repository);
    });

final factionUnitAbilitiesListProvider = FutureProvider<List<FactionUnitAbilityDOM>>((ref) async
    {
        final useCase = ref.watch(getAllFactionUnitAbilitiesUseCaseProvider);
        return useCase();
    });
