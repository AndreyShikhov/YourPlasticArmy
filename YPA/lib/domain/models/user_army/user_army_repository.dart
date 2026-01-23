import '../../../core/database/tables/seed/seed_objects/_types.dart';
import 'user_army_dom.dart';

abstract class UserArmyRepository {
  Future<List<UserArmyDOM>> findAll();
  // Новый метод для получения армий вместе с именами их кодексов
  Future<List<Map<UserArmyDOM, String>>> findAllWithCodexNames();

  Future<UserArmyDOM?> findUserArmyById(String id);

  Future<void> saveUserArmy(UserArmyDOM userArmy);

  Future<void> deleteUserArmy(String id);

  Future<void> addUnitToUserArmy(UserArmyDOM userArmy);

  Future<void> removeLastUnitFromUserArmy( String armyId, UnitRoleCode role, String unitId);

}
