import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../army_builder_controller.dart';

class ArmyNameEditor extends ConsumerStatefulWidget {
  final String armyId;
  final String initialName;

  const ArmyNameEditor({super.key, required this.armyId, required this.initialName});

  @override
  ConsumerState<ArmyNameEditor> createState() => _ArmyNameEditorState();
}

class _ArmyNameEditorState extends ConsumerState<ArmyNameEditor> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialName);
  }

  @override
  void didUpdateWidget(ArmyNameEditor oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Если имя изменилось извне (например, при загрузке), обновляем контроллер
    if (oldWidget.initialName != widget.initialName && _controller.text != widget.initialName) {
      _controller.text = widget.initialName;
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
            ref.read(armyBuilderControllerProvider(widget.armyId).notifier).updateNameArmyRoster(value);
          },
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            labelText: 'Army Name',
            labelStyle: TextStyle(color: Colors.white70),
            hintText: 'Enter name...',
            hintStyle: TextStyle(color: Colors.white38),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
