import 'package:ypa/domain/models/army/army.dart';

class GetAllArmies {
  final ArmyRepository repository;

  GetAllArmies(this.repository);

  Future<List<ArmyDOM>> call() async {
    return await repository.findAll();
  }
}
