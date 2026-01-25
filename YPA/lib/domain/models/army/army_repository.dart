/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import '../faction/faction_id.dart';
import 'army_dom.dart';
import 'army_id.dart';

abstract class ArmyRepository
{
    Future<void> save(ArmyDOM army);
    Future<ArmyDOM?> findById(ArmyId id);
    Future<List<ArmyDOM>> findAll();
    Future<List<ArmyDOM>> findByFaction(FactionId factionId);
    Future<void> delete(ArmyId id);
}
