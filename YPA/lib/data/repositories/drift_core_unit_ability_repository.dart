import 'package:ypa/core/database/app_database.dart';
import 'package:ypa/data/mappers/core_unit_ability_mapper.dart';
import 'package:ypa/domain/models/core_unit_ability/core_unit_ability_dom.dart';
import 'package:ypa/domain/models/core_unit_ability/core_unit_ability_repository.dart';

class DriftCoreUnitAbilityRepository implements CoreUnitAbilityRepository {
  final AppDatabase db;

  DriftCoreUnitAbilityRepository(this.db);

  @override
  Future<List<CoreUnitAbilityDOM>> findAll() async {
    final rows = await db.select(db.coreUnitAbilities).get();
    return rows.map(CoreUnitAbilityMapper.fromRow).toList();
  }

  @override
  Future<CoreUnitAbilityDOM?> findByCode(String code) async {
    final row = await (db.select(db.coreUnitAbilities)..where((tbl) => tbl.code.equals(code))).getSingleOrNull();
    return row != null ? CoreUnitAbilityMapper.fromRow(row) : null;
  }
}
