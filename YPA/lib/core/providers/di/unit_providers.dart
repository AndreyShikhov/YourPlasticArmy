import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/application/role/get_all_roles.dart';
import 'package:ypa/application/unit/create_unit.dart';
import 'package:ypa/application/unit/delete_unit.dart';
import 'package:ypa/application/unit/get_all_units.dart';
import 'package:ypa/application/unit/get_units_by_army.dart';
import 'package:ypa/application/unit/update_unit.dart';
import 'package:ypa/core/database/database_providers.dart';
import 'package:ypa/data/repositories/drift_role_repository.dart';
import 'package:ypa/data/repositories/drift_unit_repository.dart';
import 'package:ypa/domain/models/army/army_id.dart';
import 'package:ypa/domain/models/role/role.dart';
import 'package:ypa/domain/models/role/role_repository.dart';
import 'package:ypa/domain/models/unit/unit.dart';
import 'package:ypa/domain/models/unit/unit_repository.dart';

// --- REPOSITORIES ---

final roleRepositoryProvider = Provider<RoleRepository>((ref) {
  final db = ref.watch(databaseProvider).requireValue;
  return DriftRoleRepository(db);
});

final unitRepositoryProvider = Provider<UnitRepository>((ref) {
  final db = ref.watch(databaseProvider).requireValue;
  return DriftUnitRepository(db);
});

// --- USE CASES (ROLE) ---

final getAllRolesUseCaseProvider = Provider<GetAllRoles>((ref) {
  final repository = ref.watch(roleRepositoryProvider);
  return GetAllRoles(repository);
});

// --- USE CASES (UNIT) ---

final getAllUnitsUseCaseProvider = Provider<GetAllUnits>((ref) {
  final repository = ref.watch(unitRepositoryProvider);
  return GetAllUnits(repository);
});

final getUnitsByArmyUseCaseProvider = Provider<GetUnitsByArmy>((ref) {
  final repository = ref.watch(unitRepositoryProvider);
  return GetUnitsByArmy(repository);
});

final createUnitUseCaseProvider = Provider<CreateUnit>((ref) {
  final repository = ref.watch(unitRepositoryProvider);
  return CreateUnit(repository);
});

final updateUnitUseCaseProvider = Provider<UpdateUnit>((ref) {
  final repository = ref.watch(unitRepositoryProvider);
  return UpdateUnit(repository);
});

final deleteUnitUseCaseProvider = Provider<DeleteUnit>((ref) {
  final repository = ref.watch(unitRepositoryProvider);
  return DeleteUnit(repository);
});

// --- UI STATE ---

final rolesListProvider = FutureProvider<List<Role>>((ref) async {
  final useCase = ref.watch(getAllRolesUseCaseProvider);
  return useCase();
});

final unitsByArmyProvider = FutureProvider.family<List<Unit>, String>((ref, armyIdRaw) async {
  final useCase = ref.watch(getUnitsByArmyUseCaseProvider);
  return useCase(ArmyId(armyIdRaw));
});
