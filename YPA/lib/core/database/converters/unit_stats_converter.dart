import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:ypa/domain/models/unit/unit_stats.dart';

class UnitStatsConverter extends TypeConverter<UnitStats, String> {
  const UnitStatsConverter();

  @override
  UnitStats fromSql(String fromDb) {
    try {
      return UnitStats.fromJson(json.decode(fromDb) as Map<String, dynamic>);
    } catch (e) {
      // Если JSON битый или пустой, возвращаем пустой объект, чтобы приложение не упало
      return UnitStats.empty();
    }
  }

  @override
  String toSql(UnitStats value) {
    return json.encode(value.toJson());
  }
}
