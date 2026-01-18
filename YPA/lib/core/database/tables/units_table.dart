import 'package:drift/drift.dart';
import 'package:ypa/core/database/converters/unit_stats_converter.dart';
import 'codexes_table.dart';
import 'armies_table.dart';
import 'role_table.dart';



@DataClassName('UnitRow')
class Units extends Table {
  TextColumn get id => text()();

  TextColumn get name => text().withLength(min: 1)();

  /// Always required
  /// Changed to TextColumn to match Armies.id (UUID)
  TextColumn get armyId =>
      text().references(Armies, #id)();

  /// Nullable (orks, demons, etc.)
  TextColumn get codexId =>
      text().nullable().references(Codexes, #id)();

  IntColumn get roleId =>
      integer().references(Role, #id)();
      
  /// Stats stored as JSON
  TextColumn get stats => text().map(const UnitStatsConverter())();

  @override
  Set<Column> get primaryKey => {id};
}
