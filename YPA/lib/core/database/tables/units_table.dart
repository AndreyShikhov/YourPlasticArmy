import 'package:drift/drift.dart';
import 'codexes_table.dart';
import 'armies_table.dart';
import 'role_table.dart';



@DataClassName('UnitRow')
class Units extends Table {
  TextColumn get id => text()();

  TextColumn get name => text().withLength(min: 1)();

  /// Always required
  IntColumn get armyId =>
      integer().references(Armies, #id)();

  /// Nullable (orks, demons, etc.)
  /// Исправлено: text() вместо integer(), так как Codexes.id это строка (UUID)
  TextColumn get codexId =>
      text().nullable().references(Codexes, #id)();

  IntColumn get roleId =>
      integer().references(Role, #id)();
}
