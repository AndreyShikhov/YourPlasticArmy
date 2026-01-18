import 'package:drift/drift.dart';
import 'package:ypa/core/database/app_database.dart';
import 'package:ypa/domain/models/army/army.dart';
import 'package:ypa/domain/models/codex/codex_id.dart';
import 'package:ypa/domain/models/detachment/detachment.dart';
import 'package:ypa/domain/models/user_army/user_army_dom.dart';

class UserArmyMapper {
  static UserArmyDOM fromRow(UserArmyRow row) {
    return UserArmyDOM(
      id: row.id,
      name: row.name,
      codexId: CodexId.fromString(row.codexId),
      armyId: ArmyId.fromInt(row.armyId),
      detachmentId: row.detachmentId,
      totalPoints: row.totalPoints,
      jsonData: row.jsonData,
      createdAt: row.createdAt,
    );
  }

  static UserArmiesCompanion toCompanion(UserArmyDOM dom) {
    return UserArmiesCompanion.insert(
      id: dom.id,
      name: dom.name,
      armyId: dom.armyId.value,
      codexId: dom.codexId.value,
      detachmentId: dom.detachment == null ? '' : dom.detachmentId.toString(),
      totalPoints: Value(dom.totalPoints),
      jsonData: dom.jsonData,
      createdAt: Value(dom.createdAt),
    );
  }
}
