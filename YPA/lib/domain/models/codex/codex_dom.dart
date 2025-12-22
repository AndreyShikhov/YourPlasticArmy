import 'codex_id.dart';
import 'codex_name.dart';

class CodexDOM {
  final CodexId id;
  final CodexName name;

  CodexDOM._({
    required this.id,
    required this.name,
  });

  factory CodexDOM.create({
    required CodexName name,
  }) {
    return CodexDOM._(
      id: CodexId.generate(),
      name: name,
    );
  }

  factory CodexDOM.restore({
    required CodexId id,
    required CodexName name,
  }) {
    return CodexDOM._(
      id: id,
      name: name,
    );
  }
}
