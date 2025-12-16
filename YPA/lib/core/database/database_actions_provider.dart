import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_database.dart';

import 'database_providers.dart';



final databaseActionsProvider = Provider<DatabaseActions>((ref) {
  final dbAsync = ref.watch(databaseProvider);

  return DatabaseActions(ref, dbAsync);
});

class DatabaseActions {
  DatabaseActions(this.ref, this.dbAsync);

  final Ref ref;
  final AsyncValue<AppDatabase> dbAsync;

  Future<AppDatabase> get _db async {
    return dbAsync.requireValue;
  }

  Future<void> clearDatabase() async {
    final db = await _db;

    await db.transaction(() async {
      await db.delete(db.units).go();
      await db.delete(db.codexes).go();
      await db.delete(db.factions).go();
    });
  }


  Future<void> seedDatabase() async {
    final db = await _db;
    await db.seedDatabase();
  }

  Future<void> resetDatabase() async {
    await clearDatabase();
    await seedDatabase();
  }
}
