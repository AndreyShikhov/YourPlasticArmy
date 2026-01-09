import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/application/user_army/get_user_armies.dart';
import 'package:ypa/core/database/database_providers.dart';
import 'package:ypa/data/repositories/drift_user_army_repository.dart';
import 'package:ypa/domain/models/user_army/user_army_repository.dart';

// --- REPOSITORIES ---

final userArmyRepositoryProvider = Provider<UserArmyRepository>((ref) {
  final db = ref.watch(databaseProvider).requireValue;
  return DriftUserArmyRepository(db);
});

// --- USE CASES ---

final getUserArmiesUseCaseProvider = Provider<GetUserArmies>((ref) {
  final repository = ref.watch(userArmyRepositoryProvider);
  return GetUserArmies(repository);
});
