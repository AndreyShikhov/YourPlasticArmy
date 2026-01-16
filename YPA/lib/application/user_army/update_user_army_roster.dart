import 'package:ypa/domain/models/user_army/user_army_repository.dart';

class UpdateUserArmyRoster {
  final UserArmyRepository repository;

  UpdateUserArmyRoster(this.repository);

  Future<void> call({
    required String id,
    required String jsonRoster,
    required int totalPoints,
  }) async {
    final army = await repository.findById(id);
    if (army != null) {
      final updatedArmy = army.copyWith(
        jsonData: jsonRoster,
        totalPoints: totalPoints,
      );
      await repository.save(updatedArmy);
    }
  }
}
