/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/application/army/get_all_armies.dart';
import 'package:ypa/application/army/get_armies_by_faction.dart';
import 'package:ypa/core/database/database_providers.dart';
import 'package:ypa/data/repositories/drift_army_repository.dart';
import 'package:ypa/domain/models/army/army.dart';
import 'package:ypa/domain/models/faction/faction_id.dart';

// --- REPOSITORIES ---

final armyRepositoryProvider = Provider<ArmyRepository>((ref)
    {
        final db = ref.watch(databaseProvider).requireValue;
        return DriftArmyRepository(db);
    });

// --- USE CASES ---

final getAllArmiesUseCaseProvider = Provider<GetAllArmies>((ref)
    {
        final repository = ref.watch(armyRepositoryProvider);
        return GetAllArmies(repository);
    });

final getArmiesByFactionUseCaseProvider = Provider<GetArmiesByFaction>((ref)
    {
        final repository = ref.watch(armyRepositoryProvider);
        return GetArmiesByFaction(repository);
    });

// --- UI STATE ---

// Провайдер всех армий
final armiesListProvider = FutureProvider<List<ArmyDOM>>((ref) async
    {
        final useCase = ref.watch(getAllArmiesUseCaseProvider);
        return useCase();
    });

// Провайдер армий для конкретной фракции (family - позволяет передать ID)
final armiesByFactionProvider = FutureProvider.family<List<ArmyDOM>, String>((ref, factionIdRaw) async
    {
        final useCase = ref.watch(getArmiesByFactionUseCaseProvider);
        // Исправление: парсим строку и вызываем фабрику
        final factionId = FactionId.fromString(factionIdRaw);
        return useCase(factionId);
    });
