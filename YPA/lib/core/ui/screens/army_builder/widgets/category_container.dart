
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/ui/screens/army_builder/army_builder_controller.dart';
import 'package:ypa/domain/models/codex/codex.dart';
import 'package:ypa/domain/models/role/role.dart';

import '../../../../database/tables/seed/seed_objects/_types.dart';
import '../army_builder_item_ui.dart';



class CategoryContainer extends ConsumerWidget {

  final String armyId;
  final UnitRoleCode role;

  // Конструктор должен выглядеть так:
  const CategoryContainer({
    super.key,
    required this.armyId,
    required this.role,
  });





  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(armyBuilderControllerProvider(armyId));


    final allUnitsFromCodex = state.getAllUnitsByRole(
        role.code); // все юниты (армия/кодекс) из базы данных по роли


    // получить все юниты определённой роли из юзхер армии
    final allCategoryUnitsFromUserArmy = state.getAllUnitsByRoleFromUserArmy(
        role.code); // все юниты (армия/кодекс) из армии пользователя

    // заполнить блок выбранными объектами юзер армии

    // заполнить блок доступных для выбора юнитов


    // Здесь будет ваша логика и контейнер со скроллом
    return Container(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // load data from user army
            children: [
              if (allCategoryUnitsFromUserArmy.isNotEmpty) ...[
                const Text('In Your Army:', style: TextStyle(fontWeight: FontWeight.bold)),
                ..._getUnitsUserArmyWindowByList(allCategoryUnitsFromUserArmy),
                const SizedBox(height: 20),
              ],
              const Text('Available Units:', style: TextStyle(fontWeight: FontWeight.bold)),
              ..._getUnitsDBWindowByList(allUnitsFromCodex),
            ],
            // load data from data base
          ),
        )
    );
  }

  // проверть детачмент на специальные правила, может быть будет нужно добавить или убрать юнитов
  void _checkDetachment(){}

  List<Widget> _getUnitsDBWindowByList(List<ArmyBuilderUnitItemUi> listUnit){
    if (listUnit.isEmpty) {
      debugPrint('Warning: listUnit is null or empty');
      return [];
    }

    return listUnit.map((unit) =>  Text(unit.name)).toList();
  }
  List<Widget> _getUnitsUserArmyWindowByList(List<ArmyBuilderUnitItemUi> listUnit){
    if (listUnit.isEmpty) {
      debugPrint('Warning: listUnit is null or empty');
      return [];
    }

    return listUnit.map((unit) =>  Text(unit.name)).toList();
  }
}