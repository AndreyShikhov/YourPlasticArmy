import 'faction_dom.dart';
import 'faction_id.dart';

abstract class FactionRepository {
  Future<void> save(FactionDOM faction);
  Future<FactionDOM?> findById(FactionId id);
  Future<List<FactionDOM>> findAll();
  Future<void> delete(FactionId id);
}
