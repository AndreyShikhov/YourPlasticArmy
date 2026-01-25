/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import '../detachment/detachment_id.dart';
import 'enhancement_dom.dart';
import 'enhancement_id.dart';

abstract class EnhancementRepository
{
    Future<void> save(EnhancementDOM enhancement);
    Future<EnhancementDOM?> findById(EnhancementId id);
    Future<List<EnhancementDOM>> findAll();
    Future<List<EnhancementDOM>> findByDetachment(DetachmentId detachmentId);
    Future<void> delete(EnhancementId id);
}
