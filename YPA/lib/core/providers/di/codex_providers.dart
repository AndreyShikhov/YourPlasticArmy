import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/application/codex/get_all_codexes.dart';
import 'package:ypa/application/codex/get_codexes_by_army.dart';
import 'package:ypa/core/database/database_providers.dart';
import 'package:ypa/data/repositories/drift_codex_repository.dart';
import 'package:ypa/domain/models/army/army_id.dart';
import 'package:ypa/domain/models/codex/codex.dart';
import 'package:ypa/domain/models/codex/codex_repository.dart';

// --- REPOSITORIES ---

final codexRepositoryProvider = Provider<CodexRepository>((ref) {
  final db = ref.watch(databaseProvider).requireValue;
  return DriftCodexRepository(db);
});

// --- USE CASES ---

final getAllCodexesUseCaseProvider = Provider<GetAllCodexes>((ref) {
  final repository = ref.watch(codexRepositoryProvider);
  return GetAllCodexes(repository);
});

final getCodexesByArmyUseCaseProvider = Provider<GetCodexesByArmy>((ref) {
  final repository = ref.watch(codexRepositoryProvider);
  return GetCodexesByArmy(repository);
});

// --- UI STATE ---

final codexesByArmyProvider = FutureProvider.family<List<Codex>, String>((ref, armyIdRaw) async {
  final useCase = ref.watch(getCodexesByArmyUseCaseProvider);
  return useCase(ArmyId(armyIdRaw));
});
