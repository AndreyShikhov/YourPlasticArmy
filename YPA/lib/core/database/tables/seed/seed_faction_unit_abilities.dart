import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/factions_unit_abilities/all_factions_unit_abilities.dart';
import '../../app_database.dart';

Future<void> seedAllFactionUnitAbilities(AppDatabase db) async {
  final data = allFactionsUnitAbilities();

  for (final item in data) {
    final id = item.id ?? const Uuid().v4();
    await db.into(db.factionUnitAbilities).insert(
      FactionUnitAbilitiesCompanion.insert(
        id: id,
        code: item.code,
        name: item.name,
        shortDescription: item.shortDescription,
        description: item.description,
      ),
      mode: InsertMode.insertOrIgnore,
    );
  }
}
