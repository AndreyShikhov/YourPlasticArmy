import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/strategems/strategems.dart';

import '../../app_database.dart';



Future<Map<String, int>> seedStrategems(
    AppDatabase db,
    Map<String, int> codexIds,
    Map<String, int> detachmentIds,
    ) async {
  final data = strategemsSeed();
  final result = <String, int>{};

  for (final strategem in data) {
    // --- codex validation ---
    if (!codexIds.containsKey(strategem.codexId)) {
      throw StateError(
        'Seed error: unknown codex "${strategem.codexId}" for strategem "${strategem.code}"',
      );
    }

    // --- resolve detachment ---
    Value<int?> detachmentDbId = const Value.absent();

    if (strategem.detachmentId != null) {
      if (!detachmentIds.containsKey(strategem.detachmentId)) {
        throw StateError(
          'Seed error: unknown detachment "${strategem.detachmentId}" for strategem "${strategem.code}"',
        );
      }

      detachmentDbId = Value(detachmentIds[strategem.detachmentId]!);
    }

    // --- insert ---
    final id = await db.into(db.strategems).insert(
      StrategemsCompanion.insert(
        code: strategem.code,
        name: strategem.name,
        description: strategem.description,
        cpCost: strategem.cpCost,
        phase: strategem.phase,
        target: strategem.target,
        effect: strategem.effect,
        codexId: codexIds[strategem.codexId]!,
        detachmentId: detachmentDbId,
      ),
    );

    result[strategem.code] = id;
  }

  return result;
}
