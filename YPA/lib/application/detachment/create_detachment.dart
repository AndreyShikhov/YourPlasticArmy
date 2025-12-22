import '../../domain/models/detachment/detachment_dom.dart';
import '../../domain/models/detachment/detachment_name.dart';
import '../../domain/models/detachment/detachment_repository.dart';

class CreateDetachment {
  final DetachmentRepository repository;

  CreateDetachment(this.repository);

  Future<DetachmentDOM> call({
    required String name,
  }) async {
    final all = await repository.findAll();

    final existing = all.where(
          (d) => d.name.value == name,
    );

    if (existing.isNotEmpty) {
      return existing.first;
    }

    final detachment = DetachmentDOM.create(
      name: DetachmentName(name),
    );

    await repository.save(detachment);

    return detachment;
  }
}