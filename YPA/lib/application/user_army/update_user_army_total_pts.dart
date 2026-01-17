import '../../domain/models/user_army/user_army_repository.dart';

class UpdateUserArmyTotalPts {
  final UserArmyRepository repository;

  UpdateUserArmyTotalPts(this.repository);

  Future<void> call({
    required String id,
    required int newTotalPts,
  }) async {
    final army = await repository.findById(id);
    if (army != null) {
      final updatedArmy = army.copyWith(totalPoints: newTotalPts);
      await repository.save(updatedArmy);
    }
  }
}
