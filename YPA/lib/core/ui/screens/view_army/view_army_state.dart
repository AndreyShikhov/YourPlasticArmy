import '../../../../domain/models/codex/codex.dart';
import '../../../../domain/models/detachment/detachment.dart';
import 'view_army_item.dart';

class ViewArmyState {
  final bool isLoading;
  final String armyName;
  final int totalPts;
  final DetachmentName? armyDetachmentName;
  final CodexName? codexName;
  final List<ViewArmyUnitItemUi> units;
  final String? error;

  const ViewArmyState({
    this.isLoading = false,
    this.armyName = '',
    this.totalPts = 0,
    this.armyDetachmentName,
    this.codexName,
    this.units = const [],
    this.error,
  });

  ViewArmyState copyWith({
    bool? isLoading,
    String? armyName,
    int? totalPts,
    DetachmentName? armyDetachmentName,
    CodexName? codexName,
    List<ViewArmyUnitItemUi>? units,
    String? error,
  }) {
    return ViewArmyState(
      isLoading: isLoading ?? this.isLoading,
      armyName: armyName ?? this.armyName,
      totalPts: totalPts ?? this.totalPts,
      armyDetachmentName: armyDetachmentName ?? this.armyDetachmentName,
      codexName: codexName ?? this.codexName,
      units: units ?? this.units,
      error: error ?? this.error,
    );
  }
}
