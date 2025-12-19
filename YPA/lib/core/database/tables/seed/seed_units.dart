import 'package:drift/drift.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';
import 'package:ypa/core/database/tables/seed/seed_objects//units/blood_angels.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/units/orks.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/units/space_marines.dart';
import '../../app_database.dart';





Future<void> seedUnits(
    AppDatabase db,
    Map<String, int> armyIds,
    Map<String, int> codexIds,
    Map<String, int> roleIds,
    ) async {

  final units = <UnitSeed>[
    ...spaceMarinesUnits(),
    ...bloodAngelsUnits(),
    ...orksUnits(),
  ];

  for (final u in units) {
    _validateUnitSeed(u, armyIds, codexIds, roleIds);

    await db.into(db.units).insert(
      UnitsCompanion.insert(
        name: u.name,
        armyId: armyIds[u.army]!,
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
    Map<String, int> armyIds,
    Map<String, int> codexIds,
    Map<String, int> roleIds,
    ) {
  if (!armyIds.containsKey(unit.army)) {
    throw StateError('Unknown army ${unit.army}');
  }

  if (!roleIds.containsKey(unit.role)) {
    throw StateError('Unknown role ${unit.role}');
  }

  if (unit.codex != null && !codexIds.containsKey(unit.codex)) {
    throw StateError('Unknown codex ${unit.codex}');
  }
}
