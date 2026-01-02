import 'package:ypa/domain/models/army/army.dart';
import 'package:ypa/domain/models/codex/codex.dart';

class GetCodexesByArmy {
  final CodexRepository repository;

  GetCodexesByArmy(this.repository);

  Future<List<CodexDOM>> call(ArmyId armyId) async {
    return await repository.findByArmy(armyId);
  }
}
