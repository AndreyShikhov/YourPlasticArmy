import 'package:ypa/core/database/app_database.dart';
import 'package:ypa/domain/models/weapon_ability/weapon_ability.dart';

class WeaponAbilityMapper {
  static WeaponAbilityDOM fromRow(WeaponAbilitiesRow row) {
    return WeaponAbilityDOM(
      id: row.id,
      code: row.code,
      name: row.name,
      shortDescription: row.shortDescription,
      description: row.description,
    );
  }
}
