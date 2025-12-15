import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/app_database.dart';
import '../repositories/army_repository.dart';

class ArmyListNotifier extends AsyncNotifier<List<Army>> {
  @override
  Future<List<Army>> build() {
    final repo = ref.watch(armyRepositoryProvider);
    return repo.getArmies();
  }

  Future<void> addArmy({
    required String name,
    required String faction,
    required int points,
  }) async {
    final repo = ref.read(armyRepositoryProvider);
    await repo.addArmy(
      name: name,
      faction: faction,
      points: points,
    );

    ref.invalidateSelf();
  }
}

final armyListProvider =
AsyncNotifierProvider<ArmyListNotifier, List<Army>>(
  ArmyListNotifier.new,
);
