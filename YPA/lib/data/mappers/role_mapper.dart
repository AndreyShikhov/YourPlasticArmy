import 'package:drift/drift.dart';

import '../../core/database/app_database.dart';
import '../../domain/models/role/role.dart';

class RoleMapper {
  static RoleDOM fromRow(RoleData row) {
    return RoleDOM.restore(id: RoleId.fromString(row.id), code: RoleCode(row.code), name: RoleName(row.name));
  }

  static RoleCompanion toCompanion(RoleDOM role) {
    return RoleCompanion(id: Value(role.id.value), code: Value(role.code.value), name: Value(role.name.value));
  }
}
