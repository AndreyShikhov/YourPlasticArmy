import 'package:uuid/uuid.dart';
import 'package:ypa/domain/models/codex/codex_id.dart';
import 'package:ypa/domain/models/user_army/user_army_dom.dart';
import 'package:ypa/domain/models/user_army/user_army_repository.dart';

import '../../domain/models/army/army_id.dart';

class CreateUserArmy {
  final UserArmyRepository repository;

  CreateUserArmy(this.repository);

  Future<void> call({
    required String name,
    required ArmyId armyId,
    required CodexId codexId,
  }) async {
    final newUserArmy = UserArmyDOM(
      id: const Uuid().v4(),
      name: name,
      armyId: armyId,
      codexId: codexId,
      totalPoints: 0,
      jsonData: '{"version": 1, "units": []}',
      createdAt: DateTime.now(),
    );

    await repository.save(newUserArmy);
  }
}
