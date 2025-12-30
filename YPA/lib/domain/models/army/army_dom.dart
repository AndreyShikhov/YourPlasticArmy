import 'army_id.dart';
import 'army_name.dart';
import 'army_code.dart';
import '../faction/faction_id.dart';

class ArmyDOM {
  final ArmyId id;
  final ArmyCode code;
  final ArmyName name;
  final FactionId factionId;

  const ArmyDOM._({
    required this.id,
    required this.code,
    required this.name,
    required this.factionId,
  });

  factory ArmyDOM.create({
    required ArmyCode code,
    required ArmyName name,
    required FactionId factionId,
  }) {
    return ArmyDOM._(
      id: ArmyId.generate(),
      code: code,
      name: name,
      factionId: factionId,
    );
  }

  factory ArmyDOM.restore({
    required ArmyId id,
    required ArmyCode code,
    required ArmyName name,
    required FactionId factionId,
  }) {
    return ArmyDOM._(
      id: id,
      code: code,
      name: name,
      factionId: factionId,
    );
  }
}