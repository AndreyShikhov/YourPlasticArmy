/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../army/army.dart';
import 'codex.dart';

class CodexDom
{
    final CodexId id;
    final CodexCodeDom code;
    final ArmyId armyId;
    final CodexName name;

    CodexDom._({required this.id, required this.code, required this.armyId, required this.name});

    factory CodexDom.create({required CodexCodeDom code, required ArmyId armyId, required CodexName name})
    {
        return CodexDom._(id: CodexId.generate(), code: code, armyId: armyId, name: name);
    }

    factory CodexDom.restore({
        required CodexId id,
        required CodexCodeDom code,
        required ArmyId armyId,
        required CodexName name
    })
    {
        return CodexDom._(id: id, code: code, armyId: armyId, name: name);
    }
}
