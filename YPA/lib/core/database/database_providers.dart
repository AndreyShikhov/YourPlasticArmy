import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_database.dart';



// ======== create data base ===========
final databaseProvider = FutureProvider<AppDatabase>((ref) async {
  final appdb = AppDatabase();


   Future<bool> isDBEmpty(AppDatabase db) async {
     final factionsList = await db.select(db.factions).get();
     return factionsList.isEmpty;
  }

  Future<void> seedDB(AppDatabase db) async{
     await db.seedDatabase();
  }

  if(await isDBEmpty(appdb)){
    await seedDB(appdb);
  }
  
  ref.onDispose(() {
    appdb.close();
  });

  return appdb;
});




