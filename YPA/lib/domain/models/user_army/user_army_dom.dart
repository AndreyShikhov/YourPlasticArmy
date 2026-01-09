import 'package:ypa/domain/models/army/army_id.dart';

class UserArmyDOM {
  final String id;
  final String name;
  final ArmyId armyId; // Ссылка на базовую армию (SM, Orks)
  final int totalPoints;
  final String jsonData; // Весь состав армии
  final DateTime createdAt;

  const UserArmyDOM({
    required this.id,
    required this.name,
    required this.armyId,
    required this.totalPoints,
    required this.jsonData,
    required this.createdAt,
  });
}
