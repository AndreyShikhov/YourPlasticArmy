/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import '../../domain/models/unit/unit.dart';
import '../../domain/models/unit/unit_repository.dart';

class GetUnitsByIdsFromDb {
  final UnitRepositoryDom repository;

  GetUnitsByIdsFromDb(this.repository);

  Future<List<UnitDOM>> call(List<String> ids) async {
    if (ids.isEmpty) return [];
    return repository.findUnitsByIds(ids);
  }
}
