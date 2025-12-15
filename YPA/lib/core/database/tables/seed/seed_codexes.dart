import '../../app_database.dart';




Future<Map<String, int>> seedCodexes(
    AppDatabase db,
    Map<String, int> factionIds,
    ) async {
  final data = {
    'Space Marines': [
      'Black Templars',
      'Blood Angels',
      'Dark Angels',
      'Deathwatch',
      'Imperial Fists',
      'Iron Hands',
      'Raven Guard',
      'Salamanders',
      'Space Wolves',
      'Ultramarines',
      'White Scars',
    ],
  };

  final result = <String, int>{};

  for (final entry in data.entries) {
    final factionId = factionIds[entry.key]!;

    for (final codex in entry.value) {
      final id = await db.into(db.codexes).insert(
        CodexesCompanion.insert(
          codex: codex,
          factionId: factionId,
        ),
      );
      result[codex] = id;
    }
  }

  return result;
}
