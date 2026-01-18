import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/units/blood_angels.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/units/orks.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/units/space_marines.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/units/ultramarines.dart';
import '../../app_database.dart';


Future<void> seedUnits(
    AppDatabase db,
    Map<String, int> armyIds,
    Map<String, String> codexIds,
    Map<String, int> roleIds,
    ) async {
  final units = <UnitSeed>[
    ...spaceMarinesUnits(),
    ...bloodAngelsUnits(),
    ...ultramarinesUnits(),
    ...orksUnits(),

  ];

  for (final u in units) {
    _validateUnitSeed(u, armyIds, codexIds, roleIds);

    // Получаем ID, используя строковые коды из Enum
    final armyId = armyIds[u.army.code]!;
    final roleId = roleIds[u.role.code]!;
    
    // Codex ID - это UUID строка
    Value<String> codexIdValue = const Value.absent();
    if (u.codex != null) {
      codexIdValue = Value(codexIds[u.codex!.code]!);
    }

    // Генерируем ID, если он не задан явно
    final unitId = u.id ?? const Uuid().v4();

    await db.into(db.units).insert(
      UnitsCompanion.insert(
        id: unitId, 
        name: u.name,
        armyId: armyId,
        codexId: codexIdValue,
        roleId: roleId,
        stats: u.stats,
      ),
      mode: InsertMode.insertOrIgnore,
    );
  }
}

void _validateUnitSeed(
    UnitSeed unit,
    Map<String, int> armyIds,
    Map<String, String> codexIds,
    Map<String, int> roleIds,
    ) {
  if (!armyIds.containsKey(unit.army.code)) {
    throw StateError(
      'Seed error: unknown army "${unit.army.code}" for unit "${unit.name}"',
    );
  }

  if (!roleIds.containsKey(unit.role.code)) {
    throw StateError(
      'Seed error: unknown role "${unit.role.code}" for unit "${unit.name}"',
    );
  }

  if (unit.codex != null && !codexIds.containsKey(unit.codex!.code)) {
    throw StateError(
      'Seed error: unknown codex "${unit.codex!.code}" for unit "${unit.name}"',
    );
  }
}
