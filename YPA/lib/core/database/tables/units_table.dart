import 'package:drift/drift.dart';
import 'codexes_table.dart';
import 'armies_table.dart';
import 'role_table.dart';



@DataClassName('UnitRow')
class Units extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1)();

  /// Always required
  IntColumn get armyId =>
      integer().references(Armies, #id)();

  /// Nullable (orks, demons, etc.)
  IntColumn get codexId =>
      integer().nullable().references(Codexes, #id)();

  IntColumn get roleId =>
      integer().references(Role, #id)();
}
