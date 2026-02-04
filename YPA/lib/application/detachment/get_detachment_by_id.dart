/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../../domain/models/detachment/detachment.dart';


class GetDetachmentById {
  final DetachmentRepository repository;

  GetDetachmentById(this.repository);

  Future<DetachmentDOM?> call(DetachmentId detachmentId)
  {
    return repository.getDetachmentById(detachmentId);
  }
}