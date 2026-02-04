/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:ypa/domain/models/faction/faction_dom.dart';
import 'package:ypa/domain/models/faction/faction_repository.dart';

class GetAllFactionsUseCase
{
    final FactionRepository repository;

    GetAllFactionsUseCase(this.repository);

    Future<List<FactionDOM>> call() 
    {
        return repository.findAll();
    }
}
