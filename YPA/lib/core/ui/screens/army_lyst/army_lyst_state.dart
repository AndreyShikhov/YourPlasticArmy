import 'package:ypa/core/ui/screens/army_lyst/army_list_item_ui.dart';

class ArmyLystState {
  final bool isLoading;
  final List<ArmyListItemUi> items;
  final String? error;

  const ArmyLystState({
    this.isLoading = false,
    this.items = const [],
    this.error,
  });

  ArmyLystState copyWith({
    bool? isLoading,
    List<ArmyListItemUi>? items,
    String? error,
  }) {
    return ArmyLystState(
      isLoading: isLoading ?? this.isLoading,
      items: items ?? this.items,
      error: error ?? this.error,
    );
  }
}
