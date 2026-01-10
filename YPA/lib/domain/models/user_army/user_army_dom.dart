import 'package:ypa/domain/models/codex/codex_id.dart';

class UserArmyDOM {
  final String id;
  final String name;
  final CodexId codexId; // ИСПРАВЛЕНО: Ссылка на кодекс вместо армии
  final int totalPoints;
  final String jsonData; 
  final DateTime createdAt;

  const UserArmyDOM({
    required this.id,
    required this.name,
    required this.codexId,
    required this.totalPoints,
    required this.jsonData,
    required this.createdAt,
  });
}
