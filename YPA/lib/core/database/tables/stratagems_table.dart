import 'package:drift/drift.dart';

enum StratagemScope {
  core,
  detachment,
}

class Stratagems extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();
  IntColumn get cpCost => integer()();

  TextColumn get when => text()();
  TextColumn get target => text()();
  TextColumn get effect => text()();

  TextColumn get scope => textEnum<StratagemScope>()();
}
