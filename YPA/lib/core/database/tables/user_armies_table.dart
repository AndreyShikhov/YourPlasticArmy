import 'package:drift/drift.dart';
import 'codexes_table.dart';
import 'detachments_table.dart';

@DataClassName('UserArmyRow')
class UserArmies extends Table {
  TextColumn get id => text()(); // UUID
  TextColumn get name => text().withLength(min: 1, max: 100)();
  
  // Codexes.id - это String (UUID), поэтому здесь должен быть text()
  TextColumn get codexId => text().references(Codexes, #id)();
  TextColumn get detachmentId => text().references(Detachments, #id)();
  
  IntColumn get totalPoints => integer().withDefault(const Constant(0))();
  TextColumn get jsonData => text()(); // Сама сборка ростера в JSON
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
