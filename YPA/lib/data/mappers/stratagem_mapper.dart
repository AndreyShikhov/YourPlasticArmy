import 'package:drift/drift.dart';
import '../../core/database/app_database.dart';
import '../../domain/models/codex/codex.dart';
import '../../domain/models/detachment/detachment.dart';
import '../../domain/models/stratagem/strategem.dart';

class StratagemMapper {
  static StratagemDOM fromRow(Stratagem row) {
    return StratagemDOM.restore(
      id: StratagemId.fromString(row.id),
      code: StratagemCode(row.code),
      name: StratagemName(row.name),
      when: StratagemWhen(row.when),
      target: StratagemTarget(row.target),
      effect: StratagemEffect(row.effect),
      cost: row.cost,
      codexId: CodexId.fromString(row.codexId!),
      detachmentId: row.detachmentId != null
          ? DetachmentId.fromString(row.detachmentId!)
          : null,
    );
  }

  static StratagemsCompanion toCompanion(StratagemDOM stratagem) {
    return StratagemsCompanion.insert(
      id: stratagem.id.value,
      code: stratagem.code.value,
      name: stratagem.name.value,
      when: stratagem.when.value,
      target: stratagem.target.value,
      effect: stratagem.effect.value,
      cost: stratagem.cost,
      codexId: Value(stratagem.codexId.value),
      detachmentId: stratagem.detachmentId != null
          ? Value(stratagem.detachmentId!.value)
          : const Value.absent(),
    );
  }
}
