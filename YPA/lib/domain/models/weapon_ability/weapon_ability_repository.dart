import 'package:ypa/domain/models/weapon_ability/weapon_ability_dom.dart';

abstract class WeaponAbilityRepository {
  Future<List<WeaponAbilityDOM>> findAll();
  Future<WeaponAbilityDOM?> findByCode(String code);
}
