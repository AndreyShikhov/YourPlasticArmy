/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import '../faction/faction.dart';
import 'army.dart';

class ArmyDOM {
  final ArmyId id;
  final ArmyCodeDom code;
  final ArmyName name;
  final FactionId factionId;

  const ArmyDOM._({required this.id, required this.code, required this.name, required this.factionId});

  factory ArmyDOM.create({
    required ArmyId id,
    required ArmyCodeDom code,
    required ArmyName name,
    required FactionId factionId,
  }) {
    return ArmyDOM._(id: id, code: code, name: name, factionId: factionId);
  }

  factory ArmyDOM.restore({
    required ArmyId id,
    required ArmyCodeDom code,
    required ArmyName name,
    required FactionId factionId,
  }) {
    return ArmyDOM._(id: id, code: code, name: name, factionId: factionId);
  }
}
