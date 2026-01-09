import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import '../../app_database.dart';

Future<void> seedUserArmies(
    AppDatabase db,
    Map<String, int> armyIds,
) async {
  // Проверяем, есть ли уже армии пользователя, чтобы не дублировать при каждом запуске
  final existing = await db.select(db.userArmies).get();
  if (existing.isNotEmpty) return;

  final spaceMarineId = armyIds['space_marines'];
  final orkId = armyIds['orks'];

  if (spaceMarineId != null) {
    await db.into(db.userArmies).insert(
      UserArmiesCompanion.insert(
        id: const Uuid().v4(),
        name: 'My First Ultramarines',
        armyId: spaceMarineId,
        totalPoints: const Value(500),
        jsonData: '{"version": 1, "units": []}', // Пустой ростер для начала
        createdAt: Value(DateTime.now()),
      ),
    );
  }

  if (orkId != null) {
    await db.into(db.userArmies).insert(
      UserArmiesCompanion.insert(
        id: const Uuid().v4(),
        name: 'Green Tide Waaagh',
        armyId: orkId,
        totalPoints: const Value(1000),
        jsonData: '{"version": 1, "units": []}',
        createdAt: Value(DateTime.now().subtract(const Duration(days: 1))),
      ),
    );
  }
}
