import 'package:drift/drift.dart';


class Role extends Table {
  IntColumn get id => integer().autoIncrement()();

  /// hq, troops, elite, fast_attack
  TextColumn get code => text().unique()();

  /// HQ, Troops, Elite
  TextColumn get name => text()();
}
