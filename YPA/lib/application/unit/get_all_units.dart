import '../../domain/models/unit/unit.dart';




class GetAllUnits {
  final UnitRepository repository;

  GetAllUnits(this.repository);

  Future<List<UnitDOM>> call() async
  {
    return await repository.findAll();
  }

}