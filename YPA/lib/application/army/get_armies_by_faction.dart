import 'package:ypa/domain/models/army/army.dart';
import 'package:ypa/domain/models/faction/faction.dart';

class GetArmiesByFaction {
  final ArmyRepository repository;

  GetArmiesByFaction(this.repository);

  Future<List<ArmyDOM>> call(FactionId factionId) async {
    return await repository.findByFaction(factionId);
  }
}
