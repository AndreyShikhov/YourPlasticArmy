import 'user_army_dom.dart';

abstract class UserArmyRepository {
  Future<List<UserArmyDOM>> findAll();
  Future<UserArmyDOM?> findById(String id);
  Future<void> save(UserArmyDOM userArmy);
  Future<void> delete(String id);
}
