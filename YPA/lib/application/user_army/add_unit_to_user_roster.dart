import '../../domain/models/user_army/user_army_repository.dart';



class AddUnitToUserRoster {
  final UserArmyRepository repository;

  AddUnitToUserRoster(this.repository);

  Future<void> call({
    required String armyId,
    required String unitId,
  }) async {
    final army = await repository.findUserArmyById(armyId);
    if (army != null) {
      String jsonData = army.jsonData;

      final updatedArmy = army.copyWith(jsonData: jsonData);
      await repository.addUnitToUserArmy(updatedArmy);
    }
  }
}