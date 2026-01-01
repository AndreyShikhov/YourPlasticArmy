import 'package:drift/drift.dart';

import 'codexes_table.dart';
import 'detachments_table.dart';

class Strategems extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get code => text().unique()();
  TextColumn get name => text()();
  TextColumn get description => text()();

  IntColumn get cpCost => integer()();

  TextColumn get phase => text()();
  TextColumn get target => text()();
  TextColumn get effect => text()();

  /// FK → Codex
  /// Исправлено: text() так как Codexes.id это UUID строка
  TextColumn get codexId =>
      text().references(Codexes, #id)();

  /// FK → Detachment (optional)
  TextColumn get detachmentId =>
      text().nullable().references(Detachments, #id)();
}
