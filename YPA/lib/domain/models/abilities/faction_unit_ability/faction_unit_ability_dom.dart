/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/


import 'package:ypa/domain/models/abilities/base_ability.dart';

class FactionUnitAbilityDOM extends BaseAbilityDom
{
    const FactionUnitAbilityDOM({
        required super.id,
        required super.code,
        required super.name,
        required super.shortDescription,
        required super.description
    });


    factory FactionUnitAbilityDOM.empty() => const FactionUnitAbilityDOM(
      id: '',
      code: '',
      name: '',
      shortDescription: '',
      description: '',
    );
}
