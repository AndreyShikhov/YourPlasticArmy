import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/strategems/strategems.dart';

import '../../app_database.dart';



Future<Map<String, int>> seedStratagems(
    AppDatabase db,
    Map<String, String> codexIds,
    Map<String, String> detachmentIds,
    ) async {
  final data = strategemsSeed();
  final result = <String, int>{};

  for (final strategem in data) {
    // --- codex validation ---
    final codexIdSeed = strategem.codexId;
    if (codexIdSeed == null) {
      throw StateError(
        'Seed error: strategem "${strategem.code}" must have a codexId',
      );
    }
    final codexCode = codexIdSeed.toLowerCase();

    if (!codexIds.containsKey(codexCode)) {
      throw StateError(
        'Seed error: unknown codex "$codexCode" for strategem "${strategem.code}"',
      );
    }

    // --- resolve detachment ---
    Value<String?> detachmentDbId = const Value.absent();

    if (strategem.detachmentId != null && strategem.detachmentId != 'NULL') {
      final detachmentCode = strategem.detachmentId!.toLowerCase();
      if (!detachmentIds.containsKey(detachmentCode)) {
        throw StateError(
          'Seed error: unknown detachment "$detachmentCode" for strategem "${strategem.code}"',
        );
      }

      detachmentDbId = Value(detachmentIds[detachmentCode]!);
    }

    // --- insert ---
    final id = await db.into(db.strategems).insert(
      StrategemsCompanion.insert(
        code: strategem.code.toLowerCase(),
        name: strategem.name,
        description: strategem.description,
        cpCost: strategem.cpCost,
        phase: strategem.phase,
        target: strategem.target,
        effect: strategem.effect,
        // Исправлено: передаем строковый UUID, без int.parse
        codexId: codexIds[codexCode]!,
        detachmentId: detachmentDbId,
      ),
    );

    result[strategem.code] = id;
  }

  return result;
}
