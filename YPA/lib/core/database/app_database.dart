import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';


// ===================
// TABLE
// ===================

class Armies extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get faction => text()();
  IntColumn get points => integer()();
}

// ===================
// DATABASE
// ===================
@DriftDatabase(
  tables: [Armies],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Army>> getAllArmies() async {
    final result = await select(armies).get();
    if( result.isNotEmpty)
    {
      return result;
    }
    return <Army>[];
    }

  Future<int> addArmy(ArmiesCompanion entry) {
    return into(armies).insert(entry);
  }
}





// ===================
// CONNECTION
// ===================
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'ypa.sqlite'));
    return NativeDatabase(file);
  });
}
