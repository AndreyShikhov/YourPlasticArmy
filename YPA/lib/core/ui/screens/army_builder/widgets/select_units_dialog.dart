import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/ui/screens/army_builder/army_builder_controller.dart';
import 'package:ypa/core/ui/screens/army_builder/widgets/unit_search_widget.dart';
import 'package:ypa/core/ui/screens/army_builder/widgets/text_unit_button.dart';

import '../../../../database/tables/seed/seed_objects/_types.dart';

class SelectUnitsDialog extends ConsumerStatefulWidget {
  final String armyId;
  final UnitRoleCode role;

  const SelectUnitsDialog({
    super.key,
    required this.armyId,
    required this.role,
  });

  @override
  ConsumerState<SelectUnitsDialog> createState() => _SelectUnitsDialogState();
}

class _SelectUnitsDialogState extends ConsumerState<SelectUnitsDialog> {
  String _searchQuery = ''; // Состояние поискового запроса

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(armyBuilderControllerProvider(widget.armyId));
    
    // 1. Получаем все юниты для данной роли из БД
    final allUnits = state.getAllUnitsByRoleFromDB(widget.role.name);

    // 2. ФИЛЬТРАЦИЯ: Оставляем только те, что содержат поисковый запрос
    final filteredUnits = _searchQuery.isEmpty
        ? allUnits // Если поиск пустой — показываем ВСЕХ юнитов
        : allUnits.where((unit) {
      final name = unit.name.toLowerCase();
      final query = _searchQuery.toLowerCase();
      return name.contains(query);
    }).toList();

    return Container(
      padding: const EdgeInsets.all(16.0),
      color: const Color.fromARGB(255, 55, 55, 55),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Виджет поиска
          UnitSearchWidget(
            armyId: widget.armyId,
            onSearch: (text) {
              setState(() {
                _searchQuery = text; // Обновляем запрос при вводе
              });
            },
          ),
          const SizedBox(height: 10),
          
          // Список ОТФИЛЬТРОВАННЫХ юнитов
          if (filteredUnits.isNotEmpty)
            ...filteredUnits.map((unit) {
              return TextUnitButton(
                unit: unit,
                armyId: widget.armyId,
              );
            }).toList()
          else if (_searchQuery.isNotEmpty)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Ничего не найдено',
                  style: TextStyle(color: Colors.white38),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
