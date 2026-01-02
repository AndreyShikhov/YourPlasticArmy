import 'role_dom.dart';
import 'role_id.dart';

abstract class RoleRepository {
  Future<void> save(RoleDOM role);
  Future<RoleDOM?> findById(RoleId id);
  Future<List<RoleDOM>> findAll();
  Future<void> delete(RoleId id);
}
