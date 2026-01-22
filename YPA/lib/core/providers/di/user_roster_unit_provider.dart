
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/providers/di/unit_providers.dart';
import 'package:ypa/core/providers/di/user_army_providers.dart';

import '../../../application/user_army/add_unit_to_user_roster.dart';




final addUnitToUserRosterUseCaseProvider = Provider((ref) {
  final armyRepo = ref.watch(userArmyRepositoryProvider);
  final unitRepo = ref.watch(unitRepositoryProvider);
  return AddUnitToUserRoster(armyRepo, unitRepo);
});