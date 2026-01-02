import '../../domain/models/detachment/detachment.dart';

class GetAllDetachments {
  final DetachmentRepository repository;

  GetAllDetachments(this.repository);

  Future<List<DetachmentDOM>> call() {
    return repository.findAll();
  }
}
