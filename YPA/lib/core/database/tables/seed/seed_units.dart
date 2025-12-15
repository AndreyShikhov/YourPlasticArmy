import 'package:drift/drift.dart';
import '../../app_database.dart';


List<Map<String, String?>> getAllSpaceMarine() {
  final listSpaceMarine = [
    {
      'name': 'Intercessor Squad',
      'faction': 'Space Marines',
      'codex': null,
    },
    {
      'name': 'Assault Intercessor Squad',
      'faction': 'Space Marines',
      'codex': null,
    },
    {
      'name': 'Heavy Intercessor Squad',
      'faction': 'Space Marines',
      'codex': null,
    },
  ];
 return listSpaceMarine;
}

List<Map<String, String?>> getAllBloodAngels() {
  final listBloodAngels = [
    {
      'name': 'Death Company',
      'faction': 'Space Marines',
      'codex': 'Blood Angels',
    },
    {
      'name': 'Death Company',
      'faction': 'Space Marines',
      'codex': 'Blood Angels',
    },
  ];
  return listBloodAngels;
}

List<Map<String, String?>> getAllOrks() {
  final listOrks = [
    {
      'name': 'Boyz',
      'faction': 'Orks',
      'codex': null,
    },
  ];
  return listOrks;
}

Future<void> seedUnits(
    AppDatabase db,
    Map<String, int> factionIds,
    Map<String, int> codexIds,
    ) async
{

  List<Map<String, String?>> units = [];

  units + getAllSpaceMarine();
  units + getAllBloodAngels();
  units + getAllOrks();

  for (final u in units) {
    await db.into(db.units).insert(
      UnitsCompanion.insert(
        name: u['name'] as String,
        factionId: factionIds[u['faction']]!,
        codexId: u['codex'] == null
            ? const Value.absent()
            : Value(codexIds[u['codex']]!),
      ),
    );
  }
}
