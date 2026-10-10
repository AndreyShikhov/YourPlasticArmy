/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:ypa/domain/models/unit/unit_stats.dart';

/// ==========================================
///  Build Unit Composition
/// ==========================================

UnitCompositionDom calculateFinalUnitComposition(UnitCompositionDom baseComposition, int newUnitInstanceIndex)
{
    AdditionalRuleCompositionDom? matchingRule(UnitCompositionModelDom model)
    {
        return baseComposition.additionalRuleFromComposition
            .where((rule) =>
                newUnitInstanceIndex >= rule.moreThan &&
                    model.amount == rule.amount)
            .fold<AdditionalRuleCompositionDom?>(
                null,
                (best, rule) =>
                best == null || rule.moreThan > best.moreThan ? rule : best
            );
    }

    UnitCompositionModelDom applyRule(UnitCompositionModelDom model)
    {
        final rule = matchingRule(model);
        return rule == null ? model : model.copyWith(cost: rule.cost);
    }

    final updatedCompositions =
        baseComposition.compositions.map(applyRule).toList();

    final selected = baseComposition.selectedComposition ??
        baseComposition.compositions.firstOrNull;

    if (selected == null) 
    {
        return baseComposition.copyWith(compositions: updatedCompositions);
    }

    final updatedSelected = updatedCompositions
        .where((model) =>
            model.amount == selected.amount &&
                model.faceText == selected.faceText)
        .firstOrNull ??
        applyRule(selected);

    return baseComposition.copyWith(
        compositions: updatedCompositions,
        selectedComposition: updatedSelected
    );
}
