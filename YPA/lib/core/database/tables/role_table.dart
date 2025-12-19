import 'package:drift/drift.dart';


class Role extends Table {
  IntColumn get id => integer().autoIncrement()();

  /// hq, troops, elite, fast_attack
  TextColumn get code => text().unique().withLength(min: 1)();

  /// HQ, Troops, Elite
  TextColumn get name => text().withLength(min: 1)();


}
