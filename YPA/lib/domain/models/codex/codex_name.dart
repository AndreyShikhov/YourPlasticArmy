class CodexName {
  final String value;

  CodexName(this.value) {
    if (value.trim().isEmpty) {
      throw ArgumentError('Codex name cannot be empty');
    }
  }
}
