import 'package:ypa/core/database/app_database.dart';
import 'package:ypa/data/mappers/weapon_ability_mapper.dart';
import '../../domain/models/weapon_ability/weapon_ability.dart';

class DriftWeaponAbilityRepository implements WeaponAbilityRepository {
  final AppDatabase db;

  DriftWeaponAbilityRepository(this.db);

  @override
  Future<List<WeaponAbilityDOM>> findAll() async {
    final rows = await db.select(db.weaponAbilities).get();
    return rows.map(WeaponAbilityMapper.fromRow).toList();
  }

  @override
  Future<WeaponAbilityDOM?> findByCode(String code) async {
    final row = await (db.select(db.weaponAbilities)..where((tbl) => tbl.code.equals(code))).getSingleOrNull();
    return row != null ? WeaponAbilityMapper.fromRow(row) : null;
  }
}
