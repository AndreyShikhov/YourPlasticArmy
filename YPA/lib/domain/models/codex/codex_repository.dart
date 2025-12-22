import 'codex_dom.dart';





abstract class CodexRepository {
  Future<void> save(CodexDOM codex);
  Future<List<CodexDOM>> findAll();
}
