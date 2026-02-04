/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../codex/codex.dart';
import 'detachment.dart';

abstract class DetachmentRepository
{
    /// Создать или сохранить Detachment
    Future<void> saveDetachment(DetachmentDOM detachment);

    /// Найти Detachment по ID
    Future<DetachmentDOM?> getDetachmentById(DetachmentId id);

    /// Найти Detachment  по CodexId
    Future<List<DetachmentDOM>> getDetachmentByCodexId(CodexId codexId);

    /// Получить все Detachment
    Future<List<DetachmentDOM>> getAllDetachment();

    /// Удалить Detachment
    Future<void> deleteDetachment(DetachmentId id);
}
