import 'package:ypa/domain/models/codex/codex_id.dart';
import 'package:ypa/domain/models/detachment/detachment.dart';

class UserArmyDOM {
  final String id;
  final String name;
  final CodexId codexId;
  final String? detachmentId;
  final DetachmentDOM? detachment;
  final int totalPoints;
  final String jsonData; 
  final DateTime createdAt;

  const UserArmyDOM({
    required this.id,
    required this.name,
    required this.codexId,
    this.detachmentId,
    this.detachment,
    required this.totalPoints,
    required this.jsonData,
    required this.createdAt,
  });

  UserArmyDOM copyWith({
    String? name,
    int? totalPoints,
    String? detachmentId,
    DetachmentDOM? detachment,
    String? jsonData,
  }) {
    return UserArmyDOM(
      id: this.id,
      name: name ?? this.name,
      codexId: this.codexId,
      detachmentId: detachmentId ?? this.detachmentId,
      detachment: detachment?? this.detachment,
      totalPoints: totalPoints ?? this.totalPoints,
      jsonData: jsonData ?? this.jsonData,
      createdAt: this.createdAt,
    );
  }
}
