import '../../app_database.dart';






Future<Map<String, int>> seedFactions(AppDatabase db) async {
  final data = [
    // ========Imperium=======
    'Space Marines',
    'Adepta Sororitas',
    'Adeptus Custodes',
    'Adeptus Mechanicus',
    'Astra Militarum',
    'Grey Knights',
    'Imperial Agents',
    'Imperial Knights',
    // ========Chaos=======
    'Chaos Daemons',
    'Chaos Knights',
    'Chaos Space Marines',
    'Death Guard',
    'Emperor’s Children',
    'Thousand Sons',
    'World Eaters',
    // ========Xenos=======
    'Aeldari',
    'Drukhari',
    'Genestealer Cults',
    'Leagues of Votann',
    'Necrons',
    'Orks',
    'T’au Empire',
    'Tyranids',

  ];

  final result = <String, int>{};

  for (final faction in data) {
    final id = await db.into(db.factions)
        .insert(FactionsCompanion.insert(faction: faction));
    result[faction] = id;
  }

  return result;
}