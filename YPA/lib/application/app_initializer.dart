import '../core/database/app_database.dart';

class AppInitializer {
  final AppDatabase db;

  AppInitializer(this.db);

  Future<void> init() async {
    // Запускаем заполнение базы данных (Core Seeding).
    // Метод seedDatabase внутри core проверяет наличие данных и добавляет их, если нужно.
    await db.seedDatabase();
  }
}
