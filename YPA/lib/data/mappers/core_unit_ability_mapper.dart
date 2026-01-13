import 'package:ypa/core/database/app_database.dart';
import 'package:ypa/domain/models/core_unit_ability/core_unit_ability_dom.dart';

class CoreUnitAbilityMapper {
  static CoreUnitAbilityDOM fromRow(CoreUnitAbilityRow row) {
    return CoreUnitAbilityDOM(
      id: row.id,
      code: row.code,
      name: row.name,
      shortDescription: row.shortDescription,
      description: row.description,
    );
  }
}
