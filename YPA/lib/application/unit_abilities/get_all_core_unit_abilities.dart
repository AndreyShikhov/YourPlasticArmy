import 'package:ypa/domain/models/core_unit_ability/core_unit_ability_dom.dart';
import 'package:ypa/domain/models/core_unit_ability/core_unit_ability_repository.dart';

class GetAllCoreUnitAbilities {
  final CoreUnitAbilityRepository repository;

  GetAllCoreUnitAbilities(this.repository);

  Future<List<CoreUnitAbilityDOM>> call() {
    return repository.findAll();
  }
}
