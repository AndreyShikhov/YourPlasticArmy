import 'core_unit_ability_dom.dart';

abstract class CoreUnitAbilityRepository {
  Future<List<CoreUnitAbilityDOM>> findAll();
  Future<CoreUnitAbilityDOM?> findByCode(String code);
}
