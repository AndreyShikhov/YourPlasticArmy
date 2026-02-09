/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:ypa/domain/models/abilities/base_ability.dart';

class BaseAbilityBloc extends StatelessWidget
{

    final List<BaseAbilityDom> abilities;

    const BaseAbilityBloc({
        super.key,
        required this.abilities
    });

    @override
    Widget build(BuildContext context)
    {

        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: abilities.map((ability) => _AbilityToggleItem(ability: ability)).toList()
        );
    }

}

class _AbilityToggleItem extends StatefulWidget
{
    final BaseAbilityDom ability;

    const _AbilityToggleItem({required this.ability});

    @override
    State<_AbilityToggleItem> createState() => _AbilityToggleItemState();
}

class _AbilityToggleItemState extends State<_AbilityToggleItem>
{
    bool _isShortRule = false; /// Состояние: развернуто или нет

    @override
    Widget build(BuildContext context) 
    {
        return Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color.fromARGB(26, 255, 255, 255), /// Легкий фон для кнопки
                borderRadius: BorderRadius.circular(8)
            ),
            child: InkWell(
                onTap: ()
                {
                    setState(()
                        {
                            _isShortRule = !_isShortRule; /// Переключаем состояние при клике
                        });
                },
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text(
                                widget.ability.name,
                                style: const TextStyle(
                                    color: Colors.orangeAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14
                                )
                            ),
                            const SizedBox(height: 6),
                            /// Переключаем текст в зависимости от состояния
                            Text(
                                _isShortRule ? widget.ability.description : widget.ability.shortDescription,
                                style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 13,
                                    height: 1.4 /// Межстрочный интервал для читаемости
                                )
                            ),
                            if (!_isShortRule)
                            const Padding(
                                padding: EdgeInsets.only(top: 4.0),
                                child: Text(
                                    'Tap to see more...',
                                    style: TextStyle(color: Colors.white24, fontSize: 10, fontStyle: FontStyle.italic)
                                )
                            )
                        ]
                    )
                )
            )
        );
    }
}

class UnitAbilityBloc extends BaseAbilityBloc
{
    const UnitAbilityBloc({
        super.key, 
        required super.abilities
    });

    @override
    Widget build(BuildContext context)
    {
        // TODO: implement build
        return super.build(context);
    }
}

class CoreAbilityBloc extends BaseAbilityBloc
{

    const CoreAbilityBloc({
        super.key,
        required super.abilities
    });

    @override
    Widget build(BuildContext context)
    {
        // TODO: implement build
        return super.build(context);
    }
}

class FactionAbilityBloc extends BaseAbilityBloc
{

    const FactionAbilityBloc({
        super.key,
        required super.abilities
    });

    @override
    Widget build(BuildContext context)
    {
        // TODO: implement build
        return super.build(context);
    }
}


class WeaponAbilityBloc extends BaseAbilityBloc
{
  const WeaponAbilityBloc({
    super.key,
    required super.abilities
  });

  @override
  Widget build(BuildContext context)
  {
    // TODO: implement build
    return super.build(context);
  }
}
