import 'package:drift/drift.dart';


class Role extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get role => text()();
}
