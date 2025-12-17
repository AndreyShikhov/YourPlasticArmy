import 'package:ypa/core/database/tables/seed/seed_objects/detachments/detachments.dart';

import '../../app_database.dart';






Future<Map<String, int>> seedDetachments(
    AppDatabase db
    ) async {
  final data =  detachmentsBase();



  final result = <String, int>{};

  for (final detachment in data) {
    final id = await db.into(db.detachments).insert(
        DetachmentsCompanion.insert(
        code: detachment.code,
        name: detachment.name,
        description: detachment.description,
        ruleName: detachment.ruleName,
        ruleShort: detachment.ruleShort,
        ruleFull: detachment.ruleFull
    )
    );
    result[detachment.code] = id;
  }

  return result;
}