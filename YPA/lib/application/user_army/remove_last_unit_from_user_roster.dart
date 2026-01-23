import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';
import 'package:ypa/domain/models/user_army/user_army_dom.dart';
import 'package:ypa/domain/models/user_army/user_army_repository.dart';


class RemoveLastUnitFromUserRoster
{
  final UserArmyRepository repository;

  RemoveLastUnitFromUserRoster(this.repository);

  Future<void> call({
    required String armyId,
    required UnitRoleCode role,
    required String unitId,}) async {

    await repository.removeLastUnitFromUserArmy(armyId, role, unitId);
  }
}