/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/application/role/get_all_roles.dart';
import 'package:ypa/core/database/database_providers.dart';
import 'package:ypa/data/repositories/drift_role_repository.dart';
import 'package:ypa/data/repositories/drift_unit_repository.dart';

import '../../../application/unit/unt_use_case.dart';
import '../../../domain/models/army/army.dart';
import '../../../domain/models/role/role.dart';
import '../../../domain/models/unit/unit.dart';

// --- REPOSITORIES ---

final roleRepositoryProvider = Provider<RoleRepository>((ref)
    {
        final db = ref.watch(databaseProvider).requireValue;
        return DriftRoleRepository(db);
    });

final unitRepositoryProvider = Provider<UnitRepositoryDom>((ref)
    {
        final db = ref.watch(databaseProvider).requireValue;
        return DriftUnitRepository(db);
    });

// --- USE CASES (ROLE) ---

final getAllRolesUseCaseProvider = Provider<GetAllRoles>((ref)
    {
        final repository = ref.watch(roleRepositoryProvider);
        return GetAllRoles(repository);
    });

// --- USE CASES (UNIT) ---

final getAllUnitsUseCaseProvider = Provider<GetAllUnits>((ref)
    {
        final repository = ref.watch(unitRepositoryProvider);
        return GetAllUnits(repository);
    });

final getUnitsByArmyUseCaseProvider = Provider<GetUnitsByArmy>((ref)
    {
        final repository = ref.watch(unitRepositoryProvider);
        return GetUnitsByArmy(repository);
    });

final createUnitUseCaseProvider = Provider<CreateUnit>((ref)
    {
        final repository = ref.watch(unitRepositoryProvider);
        return CreateUnit(repository);
    });

final deleteUnitUseCaseProvider = Provider<DeleteUnit>((ref)
    {
        final repository = ref.watch(unitRepositoryProvider);
        return DeleteUnit(repository);
    });

final findUnitByIdFromDbUseCaseProvider = Provider<GetUnitByIdFromDb>((ref)
    {
        final repository = ref.watch(unitRepositoryProvider);
        return GetUnitByIdFromDb(repository);
    });

final getUnitsByIdsFromDbUseCaseProvider = Provider<GetUnitsByIdsFromDb>((ref)
    {
        final repository = ref.watch(unitRepositoryProvider);
        return GetUnitsByIdsFromDb(repository);
    });

// --- UI STATE ---

final rolesListProvider = FutureProvider<List<RoleDOM>>((ref) async
    {
        final useCase = ref.watch(getAllRolesUseCaseProvider);
        return useCase();
    });

final unitsByArmyProvider = FutureProvider.family<List<UnitDOM>, String>((ref, armyIdRaw) async
    {
        final useCase = ref.watch(getUnitsByArmyUseCaseProvider);
        // Исправление: armyIdRaw теперь строка UUID, парсинг в int не нужен
        final armyId = ArmyId.fromString(armyIdRaw);
        return useCase(armyId);
    });
