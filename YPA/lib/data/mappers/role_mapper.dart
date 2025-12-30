import 'package:drift/drift.dart';

import '../../core/database/app_database.dart';
import '../../core/database/tables/role_table.dart';
import '../../domain/models/role/role_dom.dart';
import '../../domain/models/role/role_id.dart';
import '../../domain/models/role/role_name.dart';
import '../../domain/models/role/role_code.dart';

class RoleMapper {
  static RoleDOM fromRow(RoleData row) {
    return RoleDOM.restore(
        id: RoleId.fromInt(row.id),
        code: RoleCode(row.code), 
        name: RoleName(row.name)
    );
  }

  static RoleCompanion toCompanion(RoleDOM role) {
    return RoleCompanion(
      id: role.id.value == 0 ? const Value.absent() : Value(role.id.value),
      code: Value(role.code.value),
      name: Value(role.name.value),
    );
  }
}