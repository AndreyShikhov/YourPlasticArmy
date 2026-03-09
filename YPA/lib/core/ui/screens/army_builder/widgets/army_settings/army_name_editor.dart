/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../army_builder_controller.dart';

class ArmyNameEditor extends ConsumerStatefulWidget
{
    final String armyId;

    const ArmyNameEditor({super.key, required this.armyId});

    @override
    ConsumerState<ArmyNameEditor> createState() => _ArmyNameEditorState();
}

class _ArmyNameEditorState extends ConsumerState<ArmyNameEditor>
{
    late TextEditingController _controller;

    @override
    void initState() 
    {
        super.initState();
        /// Инициализируем контроллер текущим значением из провайдера (однократно)
        final initialName = ref.read(armyBuilderControllerProvider(widget.armyId)).userArmyName;
        _controller = TextEditingController(text: initialName);
    }

    @override
    void dispose() 
    {
        _controller.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) 
    {
        /// СЛУШАЕМ изменения имени (например, если они пришли из базы)
        /// Это заменяет didUpdateWidget и предотвращает лишние перерисовки
        ref.listen(
            armyBuilderControllerProvider(widget.armyId).select((s) => s.userArmyName),
            (previous, next)
            {
                if (next != _controller.text) 
                {
                    _controller.text = next;
                }
            }
        );

        return TextField(
            controller: _controller,
            onChanged: (value)
            {
                /// Сохраняем в базу (с дебаунсом, который у тебя уже есть в контроллере)
                ref.read(armyBuilderControllerProvider(widget.armyId).notifier).updateNameArmyRoster(value);
            },
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                labelText: 'Army Name',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)))
        );
    }
}
