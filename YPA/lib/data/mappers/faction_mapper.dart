import 'package:drift/drift.dart';

import '../../core/database/app_database.dart';
import '../../domain/models/faction/faction.dart';


class FactionMapper {
  static FactionDOM fromRow(Faction row) {
    return FactionDOM.restore(
      id: FactionId.fromString(row.id),
      code: FactionCode(row.code),
      name: FactionName(row.name),
    );
  }

  static FactionsCompanion toCompanion(FactionDOM faction) {
    return FactionsCompanion(
      id: Value(faction.id.value),
      code: Value(faction.code.value),
      name: Value(faction.name.value),
    );
  }
}
