import 'package:drift/drift.dart';
import 'package:ypa/core/database/app_database.dart';
import 'package:ypa/data/mappers/user_army_mapper.dart';
import 'package:ypa/domain/models/user_army/user_army_dom.dart';
import 'package:ypa/domain/models/user_army/user_army_repository.dart';

class DriftUserArmyRepository implements UserArmyRepository {
  final AppDatabase db;

  DriftUserArmyRepository(this.db);

  @override
  Future<List<UserArmyDOM>> findAll() async {
    final rows = await db.select(db.userArmies).get();
    return rows.map(UserArmyMapper.fromRow).toList();
  }

  // ОПТИМИЗАЦИЯ: Получаем всё одним запросом через JOIN
  @override
  Future<List<Map<UserArmyDOM, String>>> findAllWithCodexNames() async {
    final query = db.select(db.userArmies).join([
      innerJoin(db.codexes, db.codexes.id.equalsExp(db.userArmies.codexId)),
    ]);

    final rows = await query.get();

    return rows.map((row) {
      final armyRow = row.readTable(db.userArmies);
      final codexName = row.readTable(db.codexes).name;
      
      return {
        UserArmyMapper.fromRow(armyRow): codexName,
      };
    }).toList();
  }

  @override
  Future<UserArmyDOM?> findUserArmyById(String id) async {
    final row = await (db.select(db.userArmies)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
    return row != null ? UserArmyMapper.fromRow(row) : null;
  }

  @override
  Future<void> saveUserArmy(UserArmyDOM userArmy) async {
    await db.into(db.userArmies).insertOnConflictUpdate(UserArmyMapper.toCompanion(userArmy));
  }

  @override
  Future<void> deleteUserArmy(String id) async {
    await (db.delete(db.userArmies)..where((tbl) => tbl.id.equals(id))).go();
  }


  @override
  Future<void> addUnitToUserArmy(UserArmyDOM userArmy) async {
    await db.into(db.userArmies).insertOnConflictUpdate(UserArmyMapper.toCompanion(userArmy));
  }
}



