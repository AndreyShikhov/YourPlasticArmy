import 'package:ypa/domain/models/stratagem/strategem.dart';
import '../codex/codex.dart';
import '../detachment/detachment.dart';

class StratagemDOM {
  final StratagemId id;
  final StratagemCode code;
  final StratagemName name;
  final StratagemDescription description;
  final int cpCost;
  final String phase;
  final String target;
  final String effect;
  final CodexId codexId;
  final DetachmentId? detachmentId;

  const StratagemDOM._({
    required this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.cpCost,
    required this.phase,
    required this.target,
    required this.effect,
    required this.codexId,
    this.detachmentId,
  });

  factory StratagemDOM.create({
    required StratagemCode code,
    required StratagemName name,
    required StratagemDescription description,
    required int cpCost,
    required String phase,
    required String target,
    required String effect,
    required CodexId codexId,
    DetachmentId? detachmentId,
  }) {
    if (cpCost < 0) {
      throw ArgumentError('cpCost cannot be negative');
    }

    return StratagemDOM._(
      id: StratagemId.fromInt(0), // Будет установлен при сохранении в БД
      code: code,
      name: name,
      description: description,
      cpCost: cpCost,
      phase: phase,
      target: target,
      effect: effect,
      codexId: codexId,
      detachmentId: detachmentId,
    );
  }

  factory StratagemDOM.restore({
    required StratagemId id,
    required StratagemCode code,
    required StratagemName name,
    required StratagemDescription description,
    required int cpCost,
    required String phase,
    required String target,
    required String effect,
    required CodexId codexId,
    DetachmentId? detachmentId,
  }) {
    return StratagemDOM._(
      id: id,
      code: code,
      name: name,
      description: description,
      cpCost: cpCost,
      phase: phase,
      target: target,
      effect: effect,
      codexId: codexId,
      detachmentId: detachmentId,
    );
  }
}