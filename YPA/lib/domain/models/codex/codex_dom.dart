import '../army/army_id.dart';
import 'codex_id.dart';
import 'codex_name.dart';

class CodexDOM {
  final CodexId id;
  final ArmyId armyId;
  final CodexName name;

  CodexDOM._({
    required this.id,
    required this.armyId,
    required this.name,
  });

  factory CodexDOM.create({
    required ArmyId armyId,
    required CodexName name,
  }) {
    return CodexDOM._(
      id: CodexId.generate(),
      armyId: armyId,
      name: name,
    );
  }

  factory CodexDOM.restore({
    required CodexId id,
    required ArmyId armyId,
    required CodexName name,
  }) {
    return CodexDOM._(
      id: id,
      armyId: armyId,
      name: name,
    );
  }
}
