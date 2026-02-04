/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

// ==========================================
// ENUMS
// ==========================================

enum DiceSides
    {
  d6,
  d3,
  none
}

extension DiceSidesX on DiceSides
{
  String get text
  {
    switch (this)
    {
      case DiceSides.d6: return 'D6';
      case DiceSides.d3: return 'D3';
      case DiceSides.none: return '';
    }
  }
}

// ==========================================
// DICE
// ==========================================

class Dice
{
  final int fix;
  final DiceSides side;
  final int amount;
  final int modifier;

  const Dice({
    required this.fix,
    this.side = DiceSides.none,
    this.amount = 0,
    this.modifier = 0
  });

  @override
  String toString()
  {
    if (fix > 0) return '$fix';
    return (amount > 0 ? '$amount' : '') + side.name + (modifier > 0 ? ' + $modifier' : '');
  }
}