import 'package:drift/drift.dart';
import 'codexes_table.dart';
import 'detachments_table.dart';

class CodexDetachments extends Table {
  TextColumn get codexId =>
      text().references(Codexes, #id)();

  TextColumn get detachmentId =>
      text().references(Detachments, #id)();

  BoolColumn get isGeneral => boolean().withDefault(const Constant(false))();


  @override
  Set<Column> get primaryKey => { codexId, detachmentId };
}


