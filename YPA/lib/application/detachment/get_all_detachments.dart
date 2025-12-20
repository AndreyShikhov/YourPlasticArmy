import '../../domain/models/detachment/detachment_dom.dart';
import '../../domain/models/detachment/repository/detachment_repository.dart';

class GetAllDetachments {
  final DetachmentRepository repository;

  GetAllDetachments(this.repository);

  Future<List<DetachmentDOM>> call() {
    return repository.findAll();
  }
}
