import 'package:drift/drift.dart';

import 'package:ypa/core/database/app_database.dart';
import 'package:ypa/domain/models/codex/codex_dom.dart';
import 'package:ypa/domain/models/codex/codex_id.dart';
import 'package:ypa/domain/models/codex/codex_name.dart';
import 'package:ypa/domain/models/army/army_id.dart';

class CodexMapper {
  static CodexDOM fromRow(Codexe row) {
    return CodexDOM.restore(
      id: CodexId.fromString(row.id),
      armyId: ArmyId.fromInt(row.armyId),
      name: CodexName(row.name),
    );
  }

  static CodexesCompanion toCompanion(CodexDOM codex) {
    return CodexesCompanion(
      id: Value(codex.id.value),
      name: Value(codex.name.value),
      armyId: Value(codex.armyId.value),
    );
  }
}
