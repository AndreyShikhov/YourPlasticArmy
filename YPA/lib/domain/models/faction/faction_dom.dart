import 'faction.dart';

class FactionDOM {
  final FactionId id;
  final FactionCode code;
  final FactionName name;

  const FactionDOM._({
    required this.id,
    required this.code,
    required this.name,
  });

  factory FactionDOM.create({
    required FactionCode code,
    required FactionName name,
  }) {
    return FactionDOM._(
      id: FactionId.fromInt(0), // Будет установлен при сохранении в БД
      code: code,
      name: name,
    );
  }

  factory FactionDOM.restore({
    required FactionId id,
    required FactionCode code,
    required FactionName name,
  }) {
    return FactionDOM._(
      id: id,
      code: code,
      name: name,
    );
  }
}