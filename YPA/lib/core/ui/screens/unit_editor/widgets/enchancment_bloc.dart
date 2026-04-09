/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */




import 'package:flutter/material.dart';

import '../../../../../domain/models/enhancement/enhancement.dart';

class EnchancmentBloc extends StatelessWidget
{

  final List<EnhancementDOM> allEnhancement;


  const EnchancmentBloc({
    super.key,
    required this.allEnhancement,
  });

  @override
  Widget build(BuildContext context)
  {
    return   Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
              'Enchancment:',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70)
          ),
           const SizedBox(height: 4),
          ..._BuildAllRowEEnhancements(allEnhancement)
        ]
    );
  }

  List<Widget> _BuildAllRowEEnhancements(List<EnhancementDOM> allEnhancement){
    List<Widget> res = [];

    for(EnhancementDOM enhancement in allEnhancement){
      res.add(Text(
          enhancement.name.value
      ));
    }
    return res;
  }

}

