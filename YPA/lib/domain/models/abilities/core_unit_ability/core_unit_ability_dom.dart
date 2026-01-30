/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/


import 'package:ypa/domain/models/abilities/base_ability.dart';

class CoreUnitAbilityDOM extends BaseAbilityDom
{
    const CoreUnitAbilityDOM({
        required super.id,
        required super.code,
        required super.name,
        required super.shortDescription,
        required super.description
    });

    factory CoreUnitAbilityDOM.empty() => const CoreUnitAbilityDOM(
      id: '',
      code: '',
      name: '',
      shortDescription: '',
      description: '',
    );
}
