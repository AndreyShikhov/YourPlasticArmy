import 'package:drift/drift.dart';


class Factions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get faction => text()();
}
