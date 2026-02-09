/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../base_ability.dart';

class WeaponAbilityDOM extends BaseAbilityDom
{
  const WeaponAbilityDOM({
    required super.id,
    required super.code,
    required super.name,
    required super.shortDescription,
    required super.description
  });

  factory WeaponAbilityDOM.empty() => const WeaponAbilityDOM(
    id: '',
    code: '',
    name: '',
    shortDescription: '',
    description: '',
  );
}
