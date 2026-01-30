/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:flutter/material.dart';
import 'package:ypa/domain/models/abilities/base_ability.dart';

class BaseAbilityBloc extends StatelessWidget
{

    final List<BaseAbilityDom> abilities;


    const BaseAbilityBloc({
        super.key,
        required this.abilities,
    });

    @override
    Widget build(BuildContext context)
    {

        return Column(
          children: [
            Text(abilities.first.description),
            SizedBox(height: 55,),
            Text(abilities.first.shortDescription),
          ],
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
