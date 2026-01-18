import 'package:drift/drift.dart';

import '../../core/database/app_database.dart';
import '../../domain/models/army/army.dart';
import '../../domain/models/faction/faction.dart';


class ArmyMapper {
  static ArmyDOM fromRow(Army row) {
    return ArmyDOM.restore(
      id: ArmyId.fromString(row.id),
      code: ArmyCode(row.armyCode),
      name: ArmyName(row.name),
      factionId: FactionId.fromInt(row.factionId),
    );
  }

  static ArmiesCompanion toCompanion(ArmyDOM army) {
    return ArmiesCompanion(
      id: Value(army.id.value),
      armyCode: Value(army.code.value),
      name: Value(army.name.value),
      factionId: Value(army.factionId.value),
    );
  }
}
