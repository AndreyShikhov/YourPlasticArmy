/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:ypa/domain/models/detachment/detachment.dart';
import 'package:ypa/domain/models/stratagem/strategem.dart';

class GetStratagemsByDetachment
{
    final StratagemRepository repository;

    GetStratagemsByDetachment(this.repository);

    Future<List<StratagemDOM>> call(DetachmentId detachmentId) async
    {
        return await repository.findStratagemsByDetachment(detachmentId);
    }
}
