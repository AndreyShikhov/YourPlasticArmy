import 'package:drift/drift.dart';

import '../../core/database/app_database.dart';
import '../../domain/models/unit/unit_dom.dart';

class UnitMapper {
  // Преобразование из строки/row в Domain
  static UnitDOM fromRow(UnitRow row) {
    return UnitDOM.restore(
      id: UnitId.fromString(row.id),
      name: UnitName(row.name),
      roleCode: UnitRoleCode.values.firstWhere((v) => v.name == row.roleCode),
      maxCount: row.maxCount,
    );
  }

  // Преобразование Domain в Companion для записи в БД
  static UnitsCompanion toCompanion(UnitDOM unit) {
    return UnitsCompanion(
      id: Value(unit.id.value),
      name: Value(unit.name.value),
      roleCode: Value(unit.roleCode.name),
      maxCount: Value(unit.maxCount),
      detachmentId: Value(unit.detachmentId.value), // связь с Detachment
    );
  }
}
