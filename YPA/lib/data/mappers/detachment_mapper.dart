import 'package:drift/drift.dart';
import 'package:ypa/domain/models/army/army_id.dart';

import '../../core/database/app_database.dart';
import '../../core/database/tables/seed/seed_objects/_types.dart';
import '../../domain/models/detachment/detachment_dom.dart';
import '../../domain/models/detachment/detachment_id.dart';
import '../../domain/models/detachment/detachment_name.dart';
import '../../domain/models/unit/unit_dom.dart';

class DetachmentMapper {
  // Преобразование из строки/row в Domain
  static DetachmentDOM fromRow(DetachmentRow row, {List<UnitDOM>? units}) {
    final allowedRoles = (row.allowedUnitRoleCodes ?? [])
        .map((role) => UnitRoleCode.values.firstWhere((v) => v.name == role))
        .toSet();

    return DetachmentDOM.restore(
      id: DetachmentId.fromString(row.id),
      armyId: ArmyId.fromInt(row.armyId),
      name: DetachmentName(row.name),
      allowedUnitTypes: allowedRoles,
      units: units,
    );
  }

  // Преобразование Domain в Companion для записи в БД
  static DetachmentsCompanion toCompanion(DetachmentDOM detachment) {
    return DetachmentsCompanion(
      id: Value(detachment.id.value),
      armyId: Value(detachment.armyId.value),
      name: Value(detachment.name.value),
      allowedUnitRoleCodes: Value(detachment.allowedUnitRoleCode.map((e) => e.name).toList()),
    );
  }
}

