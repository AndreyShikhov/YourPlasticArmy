import 'package:drift/drift.dart';
import 'detachments_table.dart';
import 'stratagems_table.dart';

class StratagemDetachments extends Table {
  IntColumn get stratagemId =>
      integer().references(Stratagems, #id)();

  IntColumn get detachmentId =>
      integer().references(Detachments, #id)();

  @override
  Set<Column> get primaryKey => { stratagemId, detachmentId };
}
