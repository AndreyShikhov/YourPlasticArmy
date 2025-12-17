import 'package:drift/drift.dart';
import 'detachments_table.dart';

class Enhancements extends Table {
  TextColumn get id => text()();
  TextColumn get code => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();

  IntColumn get detachmentId =>
      integer().references(Detachments, #id)();

  IntColumn get points => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<Set<Column>> get uniqueKeys => [
    {code, detachmentId},
  ];
}
