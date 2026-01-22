import 'package:ypa/domain/models/user_army/user_army_repository.dart';

class UpdateUserArmyName {
  final UserArmyRepository repository;

  UpdateUserArmyName(this.repository);

  Future<void> call({
    required String id,
    required String newName,
  }) async {
    final army = await repository.findUserArmyById(id);
    if (army != null) {
      final updatedArmy = army.copyWith(name: newName);
      await repository.saveUserArmy(updatedArmy);
    }
  }
}
