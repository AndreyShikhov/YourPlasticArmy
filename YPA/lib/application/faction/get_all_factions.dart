/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:ypa/domain/models/faction/faction.dart';

class GetAllFactions
{
    final FactionRepository repository;

    GetAllFactions(this.repository);

    Future<List<FactionDOM>> call() async
    {
        return await repository.findAll();
    }
}
