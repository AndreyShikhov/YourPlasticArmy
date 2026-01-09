import 'package:drift/drift.dart';
import 'armies_table.dart';

@DataClassName('UserArmyRow')
class UserArmies extends Table {
  TextColumn get id => text()(); // UUID
  TextColumn get name => text().withLength(min: 1, max: 100)();
  IntColumn get armyId => integer().references(Armies, #id)(); // Ссылка на справочник армий (SM, Orks etc)
  IntColumn get totalPoints => integer().withDefault(const Constant(0))();
  TextColumn get jsonData => text()(); // Сама сборка ростера в JSON
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
