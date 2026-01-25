/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'faction.dart';

class FactionDOM
{
    final FactionId id;
    final FactionCode code;
    final FactionName name;

    const FactionDOM._({
        required this.id,
        required this.code,
        required this.name
    });

    factory FactionDOM.create({
        required FactionCode code,
        required FactionName name
    })
    {
        return FactionDOM._(
            id: FactionId.generate(), // Генерируем UUID при создании
            code: code,
            name: name
        );
    }

    factory FactionDOM.restore({
        required FactionId id,
        required FactionCode code,
        required FactionName name
    })
    {
        return FactionDOM._(
            id: id,
            code: code,
            name: name
        );
    }
}
