/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:drift/drift.dart';
import 'package:ypa/core/database/app_database.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';
import 'package:ypa/domain/models/army/army.dart';
import 'package:ypa/domain/models/codex/codex_id.dart';
import 'package:ypa/domain/models/user_army/user_army_dom.dart';

import '../../domain/models/faction/faction.dart';

class UserArmyMapper
{
    static UserArmyDOM fromRow(UserArmyRow row) 
    {
        return UserArmyDOM(
            id: row.id,
            userArmyName: row.name,
            factionId: FactionId.fromString(row.factionId),
            armyId: ArmyId.fromString(row.armyId),
            codexId: CodexId.fromString(row.codexId),
            detachmentId: row.detachmentId,
            selectedBattleSize: BattleSize.selected(
                BattleSizeCodeX.fromName(row.selectedBattleSize) ?? BattleSizeCode.strikeForce
            ),
            jsonData: row.jsonData,
            createdAt: row.createdAt
        );
    }

    static UserArmiesCompanion toCompanion(UserArmyDOM dom) 
    {
        return UserArmiesCompanion.insert(
            id: dom.id,
            name: dom.userArmyName,
            factionId: dom.factionId.value,
            armyId: dom.armyId.value,
            codexId: dom.codexId.value,
            detachmentId: dom.detachment == null ? '' : dom.detachmentId.toString(),
            selectedBattleSize: dom.selectedBattleSize?.selected?.name ?? BattleSizeCode.strikeForce.name,
            jsonData: dom.jsonData,
            createdAt: Value(dom.createdAt)
        );
    }
}
