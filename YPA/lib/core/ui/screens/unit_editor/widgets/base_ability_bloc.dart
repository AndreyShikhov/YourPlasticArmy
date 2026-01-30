/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:flutter/material.dart';

class BaseAbilityBloc extends StatelessWidget
{

    final String description;
    final String shortDescription;

    const BaseAbilityBloc({
        super.key,
        required this.description,
        required this.shortDescription
    });

    @override
    Widget build(BuildContext context)
    {

        return Column(
          children: [
            Text(description),
            SizedBox(height: 55,),
            Text(shortDescription),
          ],
        );
    }

}

class UnitAbilityBloc extends BaseAbilityBloc
{
    const UnitAbilityBloc({
        super.key, 
        required super.description, 
        required super.shortDescription
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
        required super.description, 
        required super.shortDescription
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
        required super.description,
        required super.shortDescription
    });

    @override
    Widget build(BuildContext context) 
    {
        // TODO: implement build
        return super.build(context);
    }
}
