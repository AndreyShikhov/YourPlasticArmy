import 'user_army_dom.dart';

abstract class UserArmyRepository {
  Future<List<UserArmyDOM>> findAll();
  // Новый метод для получения армий вместе с именами их кодексов
  Future<List<Map<UserArmyDOM, String>>> findAllWithCodexNames(); 
  Future<UserArmyDOM?> findById(String id);
  Future<void> save(UserArmyDOM userArmy);
  Future<void> delete(String id);
}
