import 'package:ypa/domain/models/unit_ability/unit_ability_dom.dart';
import 'package:ypa/domain/models/unit_ability/unit_ability_repository.dart';

class GetAllUnitAbilities {
  final UnitAbilityRepository repository;

  GetAllUnitAbilities(this.repository);

  Future<List<UnitAbilityDOM>> call() {
    return repository.findAll();
  }
}
