/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/application/strategem/get_stratagems_by_detachment.dart';
import 'package:ypa/core/database/database_providers.dart';
import 'package:ypa/data/repositories/repositories.dart';
import 'package:ypa/domain/models/detachment/detachment.dart';
import 'package:ypa/domain/models/enhancement/enhancement_dom.dart';
import 'package:ypa/domain/models/stratagem/stratagem.dart';

import '../../../application/detachment/detachments_use_cases.dart';
import '../../../application/detachment/get_detachment_by_id.dart';
import 'enhancment_provider.dart';

// --- REPOSITORIES ---

final detachmentRepositoryProvider = Provider<DetachmentRepository>((ref)
    {
        final db = ref.watch(databaseProvider).requireValue;
        return DriftDetachmentRepository(db);
    });

final stratagemRepositoryProvider = Provider<StratagemRepository>((ref)
    {
        final db = ref.watch(databaseProvider).requireValue;
        return DriftStratagemRepository(db);
    });



/// --- USE CASES ---

final getAllDetachmentsUseCaseProvider = Provider<GetAllDetachments>((ref)
    {
        final repository = ref.watch(detachmentRepositoryProvider);
        return GetAllDetachments(repository);
    });

final getStratagemsByDetachmentUseCaseProvider = Provider<GetStratagemsByDetachment>((ref)
    {
        final repository = ref.watch(stratagemRepositoryProvider);
        return GetStratagemsByDetachment(repository);
    });


final getAlldetachmentsByCodexIdUseCaseProvider = Provider<GetAllDetachmentsByCodexId>((ref)
    {
        final repository = ref.watch(detachmentRepositoryProvider);
        return GetAllDetachmentsByCodexId(repository);
    });

final getDetachmentByIdUseCaseProvider = Provider<GetDetachmentById>((ref)
    {
        final repository = ref.watch(detachmentRepositoryProvider);
        return GetDetachmentById(repository);
    });

// --- UI STATE ---

/// Список всех детачментов
final allDetachmentsProvider = FutureProvider<List<DetachmentDOM>>((ref) async
    {
        final useCase = ref.watch(getAllDetachmentsUseCaseProvider);
        return useCase();
    });

/// Стратагемы для конкретного детачмента
final stratagemsByDetachmentProvider = FutureProvider.family<List<StratagemDOM>, String>((ref, detachmentIdRaw) async
    {
        final useCase = ref.watch(getStratagemsByDetachmentUseCaseProvider);
        // Исправление: используем фабрику fromString
        final detachmentId = DetachmentId.fromString(detachmentIdRaw);
        return useCase(detachmentId);
    });

/// Улучшения для конкретного детачмента
final enhancementsByDetachmentProvider = FutureProvider.family<List<EnhancementDOM>, String>((ref, detachmentIdRaw) async
    {
        final useCase = ref.watch(getAllEnhancementsByDetachmentUseCaseProvider);
        /// Исправление: используем фабрику fromString
        final detachmentId = DetachmentId.fromString(detachmentIdRaw);
        return useCase(detachmentId);
    });
