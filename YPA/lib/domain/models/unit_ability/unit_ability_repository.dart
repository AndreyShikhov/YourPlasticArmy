import 'package:ypa/domain/models/unit_ability/unit_ability_dom.dart';

abstract class UnitAbilityRepository {
  Future<List<UnitAbilityDOM>> findAll();
  Future<UnitAbilityDOM?> findByCode(String code);
}
