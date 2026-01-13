import 'faction_unit_ability_dom.dart';

abstract class FactionUnitAbilityRepository {
  Future<List<FactionUnitAbilityDOM>> findAll();
  Future<FactionUnitAbilityDOM?> findByCode(String code);
}
