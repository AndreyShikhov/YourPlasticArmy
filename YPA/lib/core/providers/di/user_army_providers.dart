/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/database/database_providers.dart';
import 'package:ypa/data/repositories/drift_user_army_repository.dart';
import 'package:ypa/domain/models/user_army/user_army_repository.dart';

import '../../../application/user_army/user_army_use_cases.dart';

// --- REPOSITORIES ---

final userArmyRepositoryProvider = Provider<UserArmyRepository>((ref)
    {
        final db = ref.watch(databaseProvider).requireValue;
        return DriftUserArmyRepository(db);
    });

// --- USE CASES ---

final getUserArmiesUseCaseProvider = Provider<GetUserArmies>((ref)
    {
        final repository = ref.watch(userArmyRepositoryProvider);
        return GetUserArmies(repository);
    });

final createUserArmyUseCaseProvider = Provider<CreateUserArmy>((ref)
    {
        final repository = ref.watch(userArmyRepositoryProvider);
        return CreateUserArmy(repository);
    });

final deleteUserArmyByIdUseCaseProvider = Provider<DeletUserArmyById>((ref)
    {
        final repository = ref.watch(userArmyRepositoryProvider);
        return DeletUserArmyById(repository);
    });

final getUserArmyByIdUseCaseProvider = Provider<GetUserArmyById>((ref)
    {
        final repository = ref.watch(userArmyRepositoryProvider);
        return GetUserArmyById(repository);
    });

final updateUserArmyNameUseCaseProvider = Provider<UpdateUserArmyName>((ref)
    {
        final repository = ref.watch(userArmyRepositoryProvider);
        return UpdateUserArmyName(repository);
    });

final updateUserArmyDetachmentUseCaseProvider = Provider<UpdateUserArmyDetachment>((ref)
    {
        final repository = ref.watch(userArmyRepositoryProvider);
        return UpdateUserArmyDetachment(repository);
    });

final updateUserArmyBattleSizeUseCaseProvider = Provider<UpdateUserArmyBattleSize>((ref)
    {
        final repository = ref.watch(userArmyRepositoryProvider);
        return UpdateUserArmyBattleSize(repository);
    });

final removeLastUnitFromUserRosterUseCaseProvider = Provider<RemoveLastUnitFromUserRoster>((ref)
    {
        final repository = ref.watch(userArmyRepositoryProvider);
        return RemoveLastUnitFromUserRoster(repository);
    });

final updateUnitParametersFromUserArmyUseCaseProvider = Provider<UpdateUnitParametersFromUserArmy>((ref)
    {
        final repository = ref.watch(userArmyRepositoryProvider);
        return UpdateUnitParametersFromUserArmy(repository);
    });