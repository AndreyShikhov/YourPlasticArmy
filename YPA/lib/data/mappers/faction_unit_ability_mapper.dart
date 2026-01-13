import 'package:ypa/core/database/app_database.dart';
import 'package:ypa/domain/models/faction_unit_ability/faction_unit_ability_dom.dart';

class FactionUnitAbilityMapper {
  static FactionUnitAbilityDOM fromRow(FactionUnitAbilityRow row) {
    return FactionUnitAbilityDOM(
      id: row.id,
      code: row.code,
      name: row.name,
      shortDescription: row.shortDescription,
      description: row.description,
    );
  }
}
