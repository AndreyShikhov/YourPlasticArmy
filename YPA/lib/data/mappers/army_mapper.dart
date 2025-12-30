import 'package:drift/drift.dart';

import '../../core/database/app_database.dart';
import '../../domain/models/army/army_dom.dart';
import '../../domain/models/army/army_id.dart';
import '../../domain/models/army/army_name.dart';
import '../../domain/models/army/army_code.dart';
import '../../domain/models/faction/faction_id.dart';

class ArmyMapper {
  static ArmyDOM fromRow(Army row) {
    return ArmyDOM.restore(
      id: ArmyId.fromInt(row.id),
      code: ArmyCode(row.armyCode),
      name: ArmyName(row.name),
      factionId: FactionId.fromInt(row.factionId),
    );
  }

  static ArmiesCompanion toCompanion(ArmyDOM army) {
    return ArmiesCompanion(
      id: army.id.value == 0 ? const Value.absent() : Value(army.id.value),
      armyCode: Value(army.code.value),
      name: Value(army.name.value),
      factionId: Value(army.factionId.value),
    );
  }
}