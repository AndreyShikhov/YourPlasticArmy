import 'package:ypa/domain/models/detachment/detachment_dom.dart';

import '../../domain/models/detachment/detachment_id.dart';
import '../../domain/models/detachment/repository/detachment_repository.dart';

import '../../core/database/app_database.dart';
import '../../data/mappers/detachment_mapper.dart';

class DriftDetachmentRepository
    implements DetachmentRepository {
  final AppDatabase db;

  DriftDetachmentRepository(this.db);

  @override
  Future<void> save(DetachmentDOM detachment) async {
    final companion =
    DetachmentMapper.toCompanion(detachment);

    await db.into(db.detachments).insertOnConflictUpdate(
      companion,
    );
  }


  @override
  Future<DetachmentDOM?> findById(DetachmentId id) async {
    final query = db.select(db.detachments)
      ..where((tbl) => tbl.id.equals(id.value));

    final row = await query.getSingleOrNull();
    if (row == null) return null;

    return DetachmentMapper.fromRow(row);
  }

  @override
  Future<List<DetachmentDOM>> findAll() async {
    final rows = await db.select(db.detachments).get();

    return rows
        .map(DetachmentMapper.fromRow)
        .toList();
  }

  @override
  Future<void> delete(DetachmentId id) async {
    await (db.delete(db.detachments)
      ..where((tbl) => tbl.id.equals(id.value)))
        .go();
  }
}
