import 'package:drift/drift.dart';


@DataClassName('DetachmentRow')
class Detachments extends Table {
  TextColumn get id => text()();

  TextColumn get code => text().unique().withLength(min: 1)();            // gladius_task_force
  TextColumn get name => text().withLength(min: 1)();              // Gladius Task Force
  TextColumn get description => text()();       // flavour

  TextColumn get ruleName => text().withLength(min: 1)();           // Combat Doctrine
  TextColumn get ruleShort => text()();          // short UI
  TextColumn get ruleFull => text()();           // full rule text
}
