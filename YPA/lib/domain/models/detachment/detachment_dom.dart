/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../../../core/database/tables/seed/seed_objects/_types.dart';
import '../army/army.dart';
import '../unit/unit.dart';
import 'detachment.dart';

class DetachmentDOM
{
    final DetachmentId id;
    final DetachmentCode code;
    final ArmyId armyId;
    final DetachmentName name;
    final DetachmentDescription description;
    final DetachmentRuleName ruleName;
    final DetachmentRuleShort ruleShort;
    final DetachmentRuleFull ruleFull;

    final List<UnitDOM> _units = [];

    DetachmentDOM._({
        required this.id,
        required this.code,
        required this.armyId,
        required this.name,
        required this.description,
        required this.ruleName,
        required this.ruleShort,
        required this.ruleFull
    });

    factory DetachmentDOM.create({
        required DetachmentCode code,
        required ArmyId armyId,
        required DetachmentName name,
        required DetachmentDescription description,
        required DetachmentRuleName ruleName,
        required DetachmentRuleShort ruleShort,
        required DetachmentRuleFull ruleFull
    })
    {
        return DetachmentDOM._(
            id: DetachmentId.generate(),
            code: code,
            armyId: armyId,
            name: name,
            description: description,
            ruleName: ruleName,
            ruleShort: ruleShort,
            ruleFull: ruleFull
        );
    }

    factory DetachmentDOM.restore({
        required DetachmentId id,
        required DetachmentCode code,
        required ArmyId armyId,
        required DetachmentName name,
        required DetachmentDescription description,
        required DetachmentRuleName ruleName,
        required DetachmentRuleShort ruleShort,
        required DetachmentRuleFull ruleFull,
        List<UnitDOM>? units
    })
    {
        final detachment = DetachmentDOM._(
            id: id,
            code: code,
            armyId: armyId,
            name: name,
            description: description,
            ruleName: ruleName,
            ruleShort: ruleShort,
            ruleFull: ruleFull
        );
        if (units != null) 
        {
            detachment._units.addAll(units);
        }
        return detachment;
    }

    List<UnitDOM> get units => List.unmodifiable(_units);

    void addUnit(UnitDOM unit, Set<UnitRoleCode> allowedUnitRoleCode) 
    {
        if (!canAddUnit(unit, allowedUnitRoleCode)) 
        {
            throw Exception('Этот юнит нельзя добавить в данный Detachment');
        }
        _units.add(unit);
    }

    void removeUnit(UnitDOM unit) 
    {
        _units.remove(unit);
    }

    bool canAddUnit(UnitDOM unit, Set<UnitRoleCode> allowedUnitRoleCode) 
    {
        /// Проверяем, сколько юнитов с таким же именем уже в детачменте
        int existingCount = _units.where((u) => u.name.value == unit.name.value).length;
        
        /// Если лимит превышен (например, больше 3 одинаковых юнитов)
        if (existingCount >= unit.repeat) return false;

        /// Проверяем, разрешена ли роль данного юнита в детачменте
        if (!allowedUnitRoleCode.contains(unit.role.value)) return false;

        return true;
    }
}
