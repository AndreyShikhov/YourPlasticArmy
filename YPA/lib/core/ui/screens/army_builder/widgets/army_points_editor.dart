import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../army_builder_controller.dart';

class ArmyPointsEditor extends ConsumerStatefulWidget {
  final String armyId;
  final String initialPoints;

  const ArmyPointsEditor({
    super.key,
    required this.armyId,
    required this.initialPoints,
  });

  @override
  ConsumerState<ArmyPointsEditor> createState() => _ArmyPointsEditorState();
}

class _ArmyPointsEditorState extends ConsumerState<ArmyPointsEditor> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialPoints);
  }

  @override
  void didUpdateWidget(ArmyPointsEditor oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Если имя изменилось извне (например, при загрузке), обновляем контроллер
    if (oldWidget.initialPoints != widget.initialPoints && _controller.text != widget.initialPoints) {
      _controller.text = widget.initialPoints;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
          onChanged: (value) {
            // Вызываем метод контроллера для сохранения в базу
            ref.read(armyBuilderControllerProvider(widget.armyId).notifier).updateTotalPoints(int.parse(value));
          },
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            labelText: 'Max points for your army',
            labelStyle: TextStyle(color: Colors.white70),
            hintText: '500 1000 2000...',
            hintStyle: TextStyle(color: Colors.white38),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white24),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),

      ],
    );
  }
}
