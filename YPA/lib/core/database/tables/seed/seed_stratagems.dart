import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/strategems/strategems.dart';

import '../../app_database.dart';

Future<Map<String, int>> seedStrategems(AppDatabase db) async {
  final data = strategemsSeed();
  final result = <String, int>{};

  for (final strategem in data) {

    // --- domain validation ---
    if (strategem.codexId == null) {
      throw StateError(
        'Strategem ${strategem.code} has no codexId',
      );
    }

    // --- resolve detachment ---
    Value<int?> detachmentDbId = const Value.absent();


    if (strategem.detachmentId != null) {
      final detachment = await (db.select(db.detachments)
        ..where((d) => d.code.equals(strategem.detachmentId!)))
          .getSingle();

      detachmentDbId = Value(detachment.id);
    }

    // --- insert ---
    final id = await db.into(db.strategems).insert(
      StrategemsCompanion.insert(
        id: const Uuid().v4(),
        code: strategem.code,
        name: strategem.name,
        description: strategem.description,
        cpCost: strategem.cpCost,
        phase: strategem.phase,
        target: strategem.target,
        effect: strategem.effect,
        codexId: strategem.codexId!,
        detachmentId: detachmentDbId,
      ),
    );

    result[strategem.code] = id;
  }

  return result;
}
