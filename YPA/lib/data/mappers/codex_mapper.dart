import 'package:drift/drift.dart';

import '../../core/database/app_database.dart';
import '../../domain/models/codex/codex_dom.dart';
import '../../domain/models/codex/codex_id.dart';
import '../../domain/models/codex/codex_name.dart';

class CodexMapper {
  static CodexDOM fromRow(Codexe row) {
    return CodexDOM.restore(
      id: CodexId.fromString(row.id),
      name: CodexName(row.name),
    );
  }

  static CodexesCompanion toCompanion(
      CodexDOM codex,
      ) {
    return CodexesCompanion(
      id: Value(codex.id.value),
      name: Value(codex.name.value),
      // code и armyId — если нужны, добавим позже
    );
  }
}
