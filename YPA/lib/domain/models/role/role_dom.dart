import 'role_id.dart';
import 'role_name.dart';
import 'role_code.dart';

class RoleDOM {
  final RoleId id;
  final RoleCode code;
  final RoleName name;

  const RoleDOM._({
    required this.id,
    required this.code,
    required this.name,
  });

  factory RoleDOM.create({
    required RoleCode code,
    required RoleName name,
  }) {
    return RoleDOM._(
      id: RoleId.fromInt(0), // Будет установлен при сохранении в БД
      code: code,
      name: name,
    );
  }

  factory RoleDOM.restore({
    required RoleId id,
    required RoleCode code,
    required RoleName name,
  }) {
    return RoleDOM._(
      id: id,
      code: code,
      name: name,
    );
  }
}