import 'package:drift/drift.dart';
import 'codexes_table.dart';
import 'detachments_table.dart';

class DetachmentCodex extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get detachmentId =>
      integer().references(Detachments, #id)();

  IntColumn get codexId =>
      integer().references(Codexes, #id)();

  @override
  List<Set<Column>> get uniqueKeys => [
      {detachmentId, codexId},
  ];
}
