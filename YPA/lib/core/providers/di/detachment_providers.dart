/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/application/enhancement/get_enhancements_by_detachment.dart';
import 'package:ypa/application/strategem/get_stratagems_by_detachment.dart';
import 'package:ypa/core/database/database_providers.dart';
import 'package:ypa/data/repositories/drift_detachment_repository.dart';
import 'package:ypa/data/repositories/drift_enhancement_repository.dart';
import 'package:ypa/data/repositories/drift_stratagem_repository.dart';
import 'package:ypa/domain/models/detachment/detachment_dom.dart';
import 'package:ypa/domain/models/detachment/detachment_id.dart';
import 'package:ypa/domain/models/detachment/detachment_repository.dart';
import 'package:ypa/domain/models/enhancement/enhancement_dom.dart';
import 'package:ypa/domain/models/enhancement/enhancement_repository.dart';
import 'package:ypa/domain/models/stratagem/stratagem_dom.dart';
import 'package:ypa/domain/models/stratagem/stratagem_repository.dart';

import '../../../application/detachment/detachments_use_cases.dart';
import '../../../application/detachment/get_detachment_by_id.dart';

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

final enhancementRepositoryProvider = Provider<EnhancementRepository>((ref)
    {
        final db = ref.watch(databaseProvider).requireValue;
        return DriftEnhancementRepository(db);
    });

// --- USE CASES ---

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

final getEnhancementsByDetachmentUseCaseProvider = Provider<GetEnhancementsByDetachment>((ref)
    {
        final repository = ref.watch(enhancementRepositoryProvider);
        return GetEnhancementsByDetachment(repository);
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

// Список всех детачментов
final allDetachmentsProvider = FutureProvider<List<DetachmentDOM>>((ref) async
    {
        final useCase = ref.watch(getAllDetachmentsUseCaseProvider);
        return useCase();
    });

// Стратагемы для конкретного детачмента
final stratagemsByDetachmentProvider = FutureProvider.family<List<StratagemDOM>, String>((ref, detachmentIdRaw) async
    {
        final useCase = ref.watch(getStratagemsByDetachmentUseCaseProvider);
        // Исправление: используем фабрику fromString
        final detachmentId = DetachmentId.fromString(detachmentIdRaw);
        return useCase(detachmentId);
    });

// Улучшения для конкретного детачмента
final enhancementsByDetachmentProvider = FutureProvider.family<List<EnhancementDOM>, String>((ref, detachmentIdRaw) async
    {
        final useCase = ref.watch(getEnhancementsByDetachmentUseCaseProvider);
        // Исправление: используем фабрику fromString
        final detachmentId = DetachmentId.fromString(detachmentIdRaw);
        return useCase(detachmentId);
    });
