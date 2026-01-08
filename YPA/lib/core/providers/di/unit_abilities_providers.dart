import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/database/database_providers.dart';
import 'package:ypa/data/repositories/drift_unit_ability_repository.dart';
import 'package:ypa/domain/models/unit_ability/unit_ability.dart';
import 'package:ypa/domain/models/unit_ability/unit_ability_repository.dart';
import 'package:ypa/application/unit_abilities/get_all_unit_abilities.dart';

// --- REPOSITORIES ---

final unitAbilityRepositoryProvider = Provider<UnitAbilityRepository>((ref) {
  final db = ref.watch(databaseProvider).requireValue;
  return DriftUnitAbilityRepository(db);
});

// --- USE CASES ---

final getAllUnitAbilitiesUseCaseProvider = Provider<GetAllUnitAbilities>((ref) {
  final repository = ref.watch(unitAbilityRepositoryProvider);
  return GetAllUnitAbilities(repository);
});

// --- UI STATE ---

final unitAbilitiesListProvider = FutureProvider<List<UnitAbility>>((ref) async {
  final useCase = ref.watch(getAllUnitAbilitiesUseCaseProvider);
  return useCase();
});
