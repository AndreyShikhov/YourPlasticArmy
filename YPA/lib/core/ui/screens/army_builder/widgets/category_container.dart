
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/ui/screens/army_builder/army_builder_controller.dart';
import 'package:ypa/domain/models/codex/codex.dart';
import 'package:ypa/domain/models/role/role.dart';

import '../army_builder_item_ui.dart';



class CategoryContainer extends ConsumerWidget {

  final String armyId;
  final CodexId codexId;
  final RoleDOM role;

  // Конструктор должен выглядеть так:
  const CategoryContainer({
    super.key,
    required this.armyId,
    required this.codexId,
    required this.role,
  });





  @override
  Widget build(BuildContext context, WidgetRef ref) {


    final state = ref.watch(armyBuilderControllerProvider(armyId));


    final allUnitsFromCodex = ref.read(armyBuilderControllerProvider(armyId).notifier).getAllUnitsByCodexId(codexId);

    // получит ьвсе юниты по ари айди из байзы данных
      // филтровать вме юниты пол рле

    // получить все юниты по кодекс айди из байзы данных
      // фильтровать все юниты по роле


    // получить все юниты определённой роли из юзхер армии
    final allCategoryUnitsFromUserArmy = state.getAllUnitsByRoleFromUserArmy(role.name.value);

    // заполнить блок выбранными объектами юзер армии

    // заполнить блок доступных для выбора юнитов





    // Здесь будет ваша логика и контейнер со скроллом
    return Container(
      child: Column(
        // load data from user army
        children: [
          const SizedBox(height: 20,)
        ],
        // load data from data base
      ),
    );
  }

  // проверть детачмент на специальные правила, может быть будет нужно добавить или убрать юнитов
  void _ChecDetachment(){}

  List<ArmyBuilderUnitItemUi> _filtredUnitsByRole(){
    return [];
  }
}