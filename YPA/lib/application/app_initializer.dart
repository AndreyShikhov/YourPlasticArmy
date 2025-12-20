

import 'package:ypa/application/seed/seed_detachments.dart';

import '../core/database/app_database.dart';
import '../data/repositories/drift_detachment_repository.dart';
import 'detachment/create_detachment.dart';

class AppInitializer {
  final AppDatabase db;

  AppInitializer(this.db);

  Future<void> init() async {
    final repo = DriftDetachmentRepository(db);
    final createDetachment = CreateDetachment(repo);

    await SeedDetachments(createDetachment).run();
  }
}
