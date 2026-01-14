import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/strategems/strategems.dart';
import '../../app_database.dart';

Future<Map<String, String>> seedStratagems(
    AppDatabase db,
    Map<String, String> codexIds,
    Map<String, String> detachmentIds,
    ) async {
  final data = strategemsSeed();
  final result = <String, String>{};

  for (final strategem in data) {
    // --- codex validation ---
    final codexCodeSeed = strategem.codexId?.toLowerCase();
    if (codexCodeSeed == null || !codexIds.containsKey(codexCodeSeed)) {
      throw StateError(
        'Seed error: unknown codex "$codexCodeSeed" for stratagem "${strategem.code.name}"',
      );
    }
    final dbCodexId = codexIds[codexCodeSeed]!;

    // --- resolve detachment ---
    Value<String?> detachmentDbId = const Value.absent();
    if (strategem.detachmentId != null && strategem.detachmentId != 'NULL') {
      final detachmentCode = strategem.detachmentId!.toLowerCase();
      if (!detachmentIds.containsKey(detachmentCode)) {
        throw StateError(
          'Seed error: unknown detachment "$detachmentCode" for stratagem "${strategem.code.name}"',
        );
      }
      detachmentDbId = Value(detachmentIds[detachmentCode]!);
    }

    // Используем ID из сида
    final String stratagemId = strategem.id;

    // --- insert ---
    await db.into(db.stratagems).insert(
      StratagemsCompanion.insert(
          id: stratagemId,
          code: strategem.code.name,
          name: strategem.name,
          when: strategem.when,
          target: strategem.target,
          effect: strategem.effect,
          cost: strategem.cost,
          codexId: dbCodexId, 
          detachmentId: detachmentDbId,
        ),
    );

    result[strategem.code.name] = stratagemId;
  }

  return result;
}
