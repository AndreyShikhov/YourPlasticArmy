/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../../domain/models/detachment/detachment.dart';

class GetAllDetachments
{
    final DetachmentRepository repository;

    GetAllDetachments(this.repository);

    Future<List<DetachmentDOM>> call() 
    {
        return repository.getAllDetachment();
    }
}
