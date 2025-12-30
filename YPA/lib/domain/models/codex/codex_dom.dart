import '../army/army_id.dart';
import 'codex_id.dart';
import 'codex_name.dart';
import 'codex_code.dart';

class CodexDOM {
  final CodexId id;
  final CodexCode code;
  final ArmyId armyId;
  final CodexName name;

  CodexDOM._({
    required this.id,
    required this.code,
    required this.armyId,
    required this.name,
  });

  factory CodexDOM.create({
    required CodexCode code,
    required ArmyId armyId,
    required CodexName name,
  }) {
    return CodexDOM._(
      id: CodexId.generate(),
      code: code,
      armyId: armyId,
      name: name,
    );
  }

  factory CodexDOM.restore({
    required CodexId id,
    required CodexCode code,
    required ArmyId armyId,
    required CodexName name,
  }) {
    return CodexDOM._(
      id: id,
      code: code,
      armyId: armyId,
      name: name,
    );
  }
}
