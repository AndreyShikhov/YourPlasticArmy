/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:ypa/domain/models/army/army.dart';


class GetArmyById
{
  final ArmyRepository repository;

  GetArmyById(this.repository);

  Future<ArmyDOM?> call(ArmyId armyId) async
  {
    return await repository.getArmyById(armyId);
  }
}