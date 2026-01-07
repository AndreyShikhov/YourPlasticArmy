import 'package:drift/drift.dart';



@DataClassName('WeaponAbilitiesRow')
class WeaponAbilities extends Table {
  TextColumn get id => text()(); // UUID

  TextColumn get code => text().unique()();

  TextColumn get name => text()();

  TextColumn get shortDescription => text()();

  TextColumn get description => text()();

  @override
  Set<Column> get primaryKey => {id};
}