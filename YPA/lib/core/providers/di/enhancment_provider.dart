/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/data/repositories/repositories.dart';

import '../../../application/enhancement/enhancement_use_case.dart';
import '../../../application/user_army/update_user_army_enhancement.dart';
import '../../../domain/models/enhancement/enhancement_repository.dart';
import '../../../domain/models/user_army/user_army_repository.dart';
import '../../database/database_providers.dart';


final enhancementRepositoryProvider = Provider<EnhancementRepository>((ref)
{
  final db = ref.watch(databaseProvider).requireValue;
  return DriftEnhancementRepository(db);
});

final userArmyRepositoryProvider = Provider<UserArmyRepository>((ref)
{
  final db = ref.watch(databaseProvider).requireValue;
  return DriftUserArmyRepository(db);
});


final getAllEnhancementsByDetachmentUseCaseProvider = Provider<GetAllEnhancementsByDetachment>((ref)
{
  final repository = ref.watch(enhancementRepositoryProvider);
  return GetAllEnhancementsByDetachment(repository);
});

final updateUserArmyEnhancementUseCaseProvider = Provider<UpdateUserArmyEnhancement>((ref)
{
  final repository = ref.watch(userArmyRepositoryProvider);
  return UpdateUserArmyEnhancement(repository);
});