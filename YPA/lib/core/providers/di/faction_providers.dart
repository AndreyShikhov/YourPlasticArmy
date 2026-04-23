/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/database/database_providers.dart';
import 'package:ypa/data/repositories/repositories.dart';
import 'package:ypa/domain/models/faction/faction_dom.dart';
import 'package:ypa/domain/models/faction/faction_repository.dart';
import 'package:ypa/domain/use_cases/get_all_factions_usecase.dart';

// --- REPOSITORIES ---

final factionRepositoryProvider = Provider<FactionRepository>((ref)
    {
        // Мы используем .requireValue, так как БД инициализирована в main.dart
        final db = ref.watch(databaseProvider).requireValue;
        return DriftFactionRepository(db);
    });

// --- USE CASES ---

final getAllFactionsUseCaseProvider = Provider<GetAllFactionsUseCase>((ref)
    {
        final repository = ref.watch(factionRepositoryProvider);
        return GetAllFactionsUseCase(repository);
    });

// --- UI STATE ---

// Провайдер состояния для UI
final factionsListProvider = FutureProvider<List<FactionDOM>>((ref) async
    {
        final useCase = ref.watch(getAllFactionsUseCaseProvider);
        return useCase();
    });
