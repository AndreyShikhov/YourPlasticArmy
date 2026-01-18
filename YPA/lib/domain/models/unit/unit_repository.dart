import 'package:ypa/domain/models/codex/codex.dart';

import 'unit_dom.dart';
import 'unit_id.dart';
import '../army/army_id.dart';

abstract class UnitRepository {
  /// Сохранить или обновить Unit
  Future<void> save(UnitDOM unit);

  /// Найти Unit по ID
  Future<UnitDOM?> findById(UnitId id);

  /// Получить все Unit
  Future<List<UnitDOM>> findAll();

  /// Найти Unit по ID армии
  Future<List<UnitDOM>> findByArmy(ArmyId armyId);

  /// Найти Unit по ID кодекса
  Future<List<UnitDOM>> findByCodex(CodexId codexId);

  /// Удалить Unit
  Future<void> delete(UnitId id);
}
