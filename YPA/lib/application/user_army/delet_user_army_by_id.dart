import 'package:ypa/domain/models/user_army/user_army_repository.dart';


class DeletUserArmyById {
  final UserArmyRepository repository;

  DeletUserArmyById(this.repository);

  Future<void> call({required String userArmyId}) async {

    await repository.deleteUserArmy(userArmyId);
  }
}
