import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/app_database.dart';
import '../database/database_providers.dart';

class ArmyRepository {
  ArmyRepository(this._db);

  final AppDatabase _db;

  Future<List<Army>> getArmies() {
    return _db.getAllArmies();
  }

  Future<int> addArmy({
    required String name,
    required String faction,
    required int points,
  }) {
    return _db.addArmy(
      ArmiesCompanion.insert(
        name: name,
        faction: faction,
        points: points,
      ),
    );
  }
}

final armyRepositoryProvider = Provider<ArmyRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return ArmyRepository(db);
});
