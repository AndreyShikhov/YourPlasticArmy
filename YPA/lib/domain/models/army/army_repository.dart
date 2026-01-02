import 'army_dom.dart';
import 'army_id.dart';
import '../faction/faction_id.dart';

abstract class ArmyRepository {
  Future<void> save(ArmyDOM army);
  Future<ArmyDOM?> findById(ArmyId id);
  Future<List<ArmyDOM>> findAll();
  Future<List<ArmyDOM>> findByFaction(FactionId factionId);
  Future<void> delete(ArmyId id);
}
