import 'package:ypa/domain/models/unit/unit_id.dart';
import 'package:ypa/domain/models/unit/unit_name.dart';

import '../../../core/database/tables/seed/seed_objects/_types.dart';



class UnitDOM {
  final UnitId id;
  final UnitName name;
  final UnitRoleCode roleCode;
  final int minCount;
  final int maxCount;

  UnitDOM._({
    required this.id,
    required this.name,
    required this.roleCode,
    required this.minCount,
    required this.maxCount,
  });

  factory UnitDOM.create({
    required UnitName name,
    required UnitRoleCode roleCode,
    int minCount = 1,
    int maxCount = 1,
  }) {
    return UnitDOM._(
      id: UnitId.generate(),
      name: name,
      roleCode: roleCode,
      minCount: minCount,
      maxCount: maxCount,
    );
  }

  factory UnitDOM.restore({
    required UnitId id,
    required UnitName name,
    required UnitRoleCode roleCode,
    int minCount = 1,
    int maxCount = 1,
  }) {
    return UnitDOM._(
      id: id,
      name: name,
      roleCode: roleCode,
      minCount: minCount,
      maxCount: maxCount,
    );
  }
}



