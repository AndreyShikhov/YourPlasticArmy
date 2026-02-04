/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../faction/faction_id.dart';
import 'army_dom.dart';
import 'army_id.dart';

abstract class ArmyRepository
{
    Future<void> saveArmy(ArmyDOM army);
    Future<ArmyDOM?> getArmyById(ArmyId id);
    Future<List<ArmyDOM>> getAllArmies();
    Future<List<ArmyDOM>> getArmyByFaction(FactionId factionId);
    Future<void> deleteArmy(ArmyId id);
}
