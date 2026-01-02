import 'dart:async';
import 'package:ypa/domain/models/unit/unit.dart';

import '../../domain/models/army/army.dart';
import '../../domain/models/codex/codex.dart';

class CreateUnit {

  final UnitRepository repository;

  CreateUnit(this.repository);

  Future<void> call({
    required UnitName name,
    required ArmyId armyId,
    required CodexId? codexId,
    required UnitRoleCodeDom role,
  }) async
  {
    final unit = UnitDOM.create(
      name: name,
      armyId: armyId,
      codexId: codexId,
      role: role
    );
    await repository.save(unit);
  }

}