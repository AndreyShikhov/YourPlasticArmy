import '../../domain/models/unit/unit.dart';


class GetUnitByIdFromDb {
  final UnitRepository repository;

  // Имя конструктора теперь совпадает с именем класса
  GetUnitByIdFromDb(this.repository);

  // Добавлен знак вопроса (UnitDOM?), так как юнита может не быть в базе
  Future<UnitDOM?> call(UnitId unitId) async {
    return await repository.findUnitByIdFromDb(unitId);
  }
}