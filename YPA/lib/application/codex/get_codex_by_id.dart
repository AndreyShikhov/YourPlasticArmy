import 'package:ypa/domain/models/codex/codex_dom.dart';
import 'package:ypa/domain/models/codex/codex_id.dart';
import 'package:ypa/domain/models/codex/codex_repository.dart';

class GetCodexById {
  final CodexRepository repository;

  GetCodexById(this.repository);

  Future<CodexDOM?> call(CodexId id) {
    return repository.findById(id);
  }
}
