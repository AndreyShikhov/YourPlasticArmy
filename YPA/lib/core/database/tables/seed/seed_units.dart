import 'package:drift/drift.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';
import 'package:ypa/core/database/tables/seed/seed_objects//units/blood_angels.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/units/orks.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/units/space_marines.dart';
import '../../app_database.dart';





Future<void> seedUnits(
    AppDatabase db,
    Map<String, int> factionIds,
    Map<String, int> codexIds,
    Map<String, int> roleIds,
    ) async
{

  final  units = <UnitSeed>[
    ...spaceMarinesUnits(),
    ...bloodAngelsUnits(),
    ...orksUnits(),
  ];



  for (final u in units) {
    _validateUnitSeed(u, factionIds, codexIds, roleIds);

    await db.into(db.units).insert(
      UnitsCompanion.insert(
        name: u.name,
        factionId: factionIds[u.faction]!,
        codexId: u.codex == null
            ? const Value.absent()
            : Value(codexIds[u.codex]!),
        roleId: roleIds[u.role]!,

      ),
    );
  }
}

void _validateUnitSeed(
    UnitSeed unit,
    Map<String, int> factionIds,
    Map<String, int> codexIds,
    Map<String, int> roleIds,
    ) {
  if (!factionIds.containsKey(unit.faction)) {
    throw StateError(
      'Seed error: unknown faction "${unit.faction}" for unit "${unit.name}"',
    );
  }

  if (!roleIds.containsKey(unit.role)) {
    throw StateError(
      'Seed error: unknown role "${unit.role}" for unit "${unit.name}"',
    );
  }

  if (unit.codex != null && !codexIds.containsKey(unit.codex)) {
    throw StateError(
      'Seed error: unknown codex "${unit.codex}" for unit "${unit.name}"',
    );
  }
}
