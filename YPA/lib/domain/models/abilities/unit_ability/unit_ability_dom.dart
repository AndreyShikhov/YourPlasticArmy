
/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import '../base_ability.dart';

class UnitAbilityDOM extends BaseAbilityDom
{
    const UnitAbilityDOM({
        required super.id,
        required super.code,
        required super.name,
        required super.shortDescription,
        required super.description
    });

    factory UnitAbilityDOM.empty() => const UnitAbilityDOM(
      id: '',
      code: '',
      name: '',
      shortDescription: '',
      description: '',
    );
}
