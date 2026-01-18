import 'package:ypa/core/database/app_database.dart';
import 'package:ypa/domain/models/army/army_id.dart';
import 'package:ypa/domain/models/codex/codex.dart';

import '../../domain/models/unit/unit.dart';
import '../mappers/mappers.dart';

class DriftUnitRepository implements UnitRepository  {
  final AppDatabase db;
  
  DriftUnitRepository(this.db);
  
  @override
  Future<void> saveUnit(UnitDOM unit) async {
    final companion = UnitMapper().toCompanion(unit);
    await db.into(db.units).insertOnConflictUpdate(companion);
  }

  @override
  Future<void> deleteUnit(UnitId id) async
  {
   await (db.delete(db.units)..where((tbl) => tbl.id.equals(id.value))).go();
  }

  @override
  Future<List<UnitDOM>> findAllUnits() async {

    final rows = await db.select(db.units).get();

    return rows.map(UnitMapper.fromRow).toList();
  }

  @override
  Future<List<UnitDOM>> findUnitsByArmy(ArmyId armyId) async {
    final rows = await (db.select(db.units)..where((tbl) => tbl.armyId.equals(armyId.value))).get();
        
    return rows.map(UnitMapper.fromRow).toList();
  }

  @override
  Future<List<UnitDOM>> findUnitsByCodex(CodexId codexId) async {
    final rows = await (db.select(db.units)..where((tbl) => tbl.codexId.equals(codexId.value))).get();

    return rows.map(UnitMapper.fromRow).toList();
  }

  @override
  Future<UnitDOM?> findUnitById(UnitId id) async {
    final row = await (db.select(db.units)..where((tbl) => tbl.id.equals(id.value))).getSingleOrNull();
        
    return row != null ? UnitMapper.fromRow(row) : null;
  }
}
