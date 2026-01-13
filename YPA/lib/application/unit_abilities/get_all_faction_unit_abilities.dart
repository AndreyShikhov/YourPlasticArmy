import 'package:ypa/domain/models/faction_unit_ability/faction_unit_ability_dom.dart';
import 'package:ypa/domain/models/faction_unit_ability/faction_unit_ability_repository.dart';

class GetAllFactionUnitAbilities {
  final FactionUnitAbilityRepository repository;

  GetAllFactionUnitAbilities(this.repository);

  Future<List<FactionUnitAbilityDOM>> call() {
    return repository.findAll();
  }
}
