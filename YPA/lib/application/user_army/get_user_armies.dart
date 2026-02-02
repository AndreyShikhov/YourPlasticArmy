/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:ypa/domain/models/user_army/user_army_dom.dart';
import 'package:ypa/domain/models/user_army/user_army_repository.dart';

class GetUserArmies
{
    final UserArmyRepository repository;

    GetUserArmies(this.repository);

    Future<List<UserArmyDOM>> call() 
    {
        return repository.getAllUserArmy();
    }
}
