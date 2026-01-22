import 'package:ypa/domain/models/user_army/user_army_dom.dart';
import 'package:ypa/domain/models/user_army/user_army_repository.dart';

class GetUserArmyById {
  final UserArmyRepository repository;

  GetUserArmyById(this.repository);

  Future<UserArmyDOM?> call(String id) {
    return repository.findUserArmyById(id);
  }
}
