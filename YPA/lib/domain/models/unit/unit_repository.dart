import 'package:ypa/domain/models/codex/codex.dart';

import 'unit_dom.dart';
import 'unit_id.dart';
import '../army/army_id.dart';

abstract class UnitRepository {
  /// Сохранить или обновить Unit
  Future<void> saveUnit(UnitDOM unit);

  /// Найти Unit по ID
  Future<UnitDOM?> findUnitByIdFromDb(UnitId id);

  /// Получить все Unit
  Future<List<UnitDOM>> findAllUnits();

  /// Найти Unit по ID армии
  Future<List<UnitDOM>> findUnitsByArmy(ArmyId armyId);

  /// Найти Unit по ID кодекса
  Future<List<UnitDOM>> findUnitsByCodex(CodexId codexId);

  /// Удалить Unit
  Future<void> deleteUnit(UnitId id);
}
