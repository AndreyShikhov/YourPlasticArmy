/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:ypa/domain/models/detachment/detachment.dart';
import 'package:ypa/domain/models/enhancement/enhancement.dart';

class GetAllEnhancementsByDetachment
{
    final EnhancementRepository repository;

    GetAllEnhancementsByDetachment(this.repository);

    Future<List<EnhancementDOM>> call(DetachmentId detachmentId) async
    {
        return await repository.findByDetachment(detachmentId);
    }
}
