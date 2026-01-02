import 'package:drift/drift.dart';
import '../../core/database/app_database.dart';
import '../../domain/models/codex/codex.dart';
import '../../domain/models/detachment/detachment.dart';
import '../../domain/models/stratagem/strategem.dart';

class StratagemMapper {
  static StratagemDOM fromRow(Strategem row) {
    return StratagemDOM.restore(
      id: StratagemId.fromInt(row.id),
      code: StratagemCode(row.code),
      name: StratagemName(row.name),
      description: StratagemDescription(row.description),
      cpCost: row.cpCost,
      phase: row.phase,
      target: row.target,
      effect: row.effect,
      codexId: CodexId.fromString(row.codexId),
      detachmentId: row.detachmentId != null ? DetachmentId.fromString(row.detachmentId.toString()) : null,
    );
  }

  static StrategemsCompanion toCompanion(StratagemDOM stratagem) {
    return StrategemsCompanion(
      id: stratagem.id.value == 0 ? const Value.absent() : Value(stratagem.id.value),
      code: Value(stratagem.code.value),
      name: Value(stratagem.name.value),
      description: Value(stratagem.description.value),
      cpCost: Value(stratagem.cpCost),
      phase: Value(stratagem.phase),
      target: Value(stratagem.target),
      effect: Value(stratagem.effect),
      codexId: Value(stratagem.codexId.value),
      detachmentId: stratagem.detachmentId != null
          ? Value(stratagem.detachmentId!.value)
          : const Value.absent(),
    );
  }
}