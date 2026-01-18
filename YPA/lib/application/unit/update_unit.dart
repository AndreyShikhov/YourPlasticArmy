import 'package:ypa/domain/models/unit/unit.dart';
import '../../domain/models/army/army.dart';
import '../../domain/models/codex/codex.dart';

class UpdateUnit {
  final UnitRepository repository;

  UpdateUnit(this.repository);

  Future<void> call({
    required UnitId id,
    UnitName? name,
    ArmyId? armyId,
    CodexId? codexId,
    UnitRoleCodeDom? role,
  }) async {
    final oldUnit = await repository.findUnitById(id);

    if (oldUnit == null) {
      throw Exception('Unit with id $id not found');
    }

    final newUnit = oldUnit.copyWith(
      name: name ?? oldUnit.name,
      armyId: armyId ?? oldUnit.armyId,
      codexId: codexId ?? oldUnit.codexId,
      role: role ?? oldUnit.role,

    );

    await repository.saveUnit(newUnit);
  }

}