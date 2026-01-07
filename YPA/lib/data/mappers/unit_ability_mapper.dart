import 'package:ypa/core/database/app_database.dart';
import 'package:ypa/domain/models/unit_ability/unit_ability_dom.dart';

class UnitAbilityMapper {
  static UnitAbilityDOM fromRow(UnitAbilitiesRow row) {
    return UnitAbilityDOM(
      id: row.id,
      code: row.code,
      name: row.name,
      shortDescription: row.shortDescription,
      description: row.description,
    );
  }
}
