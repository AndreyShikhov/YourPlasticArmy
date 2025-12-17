import 'package:drift/drift.dart';

class Detachments extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get code => text()();            // gladius_task_force
  TextColumn get name => text()();              // Gladius Task Force
  TextColumn get description => text()();       // flavour

  TextColumn get ruleName => text()();           // Combat Doctrine
  TextColumn get ruleShort => text()();          // short UI
  TextColumn get ruleFull => text()();           // full rule text
}
