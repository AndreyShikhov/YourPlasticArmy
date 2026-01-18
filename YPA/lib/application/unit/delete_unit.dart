import 'package:ypa/domain/models/unit/unit.dart';

class DeleteUnit {
  final UnitRepository repository;

  DeleteUnit(this.repository);

  Future<void> call(UnitId id) async {
    await repository.deleteUnit(id);
  }
}