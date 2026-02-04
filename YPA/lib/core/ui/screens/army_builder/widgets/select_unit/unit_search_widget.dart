/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UnitSearchWidget extends ConsumerStatefulWidget
{
    final String armyId;
    final ValueChanged<String> onSearch; /// Коллбэк для передачи текста наверх

    const UnitSearchWidget({super.key, required this.armyId, required this.onSearch});

    @override
    ConsumerState<UnitSearchWidget> createState() => _UnitSearchWidgetState();
}

class _UnitSearchWidgetState extends ConsumerState<UnitSearchWidget>
{
    late TextEditingController _controller;

    @override
    void initState()
    {
        super.initState();
        _controller = TextEditingController();
    }

    @override
    void dispose()
    {
        _controller.dispose(); /// Обязательно освобождаем ресурсы
        super.dispose();
    }

    @override
    Widget build(BuildContext context)
    {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                controller: _controller,
                onChanged: widget.onSearch, /// Передаем текст при каждом изменении
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: 'Unit name...',
                    hintStyle: const TextStyle(color: Colors.white38),
                    prefixIcon: const Icon(Icons.search, color: Colors.orangeAccent),
                    suffixIcon: IconButton(
                        icon: const Icon(Icons.clear, color: Colors.white38),
                        onPressed: ()
                        {
                            _controller.clear();
                            widget.onSearch(''); /// Сбрасываем фильтр
                        }
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 45, 45, 45),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none)
                )
            )
        );
    }
}
