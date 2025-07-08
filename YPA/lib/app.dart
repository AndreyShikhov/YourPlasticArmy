import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ypa/core/buttons.dart';
import 'package:ypa/core/pages.dart';
import 'core/data/data.dart';

void main() {
  runApp( const Ypa());

  // Объект → JSON
  UnitCardData testData = UnitCardData(unitName: 'testName',
      movement: 6,
      toughness: 4,
      save: 3,
      invulnerableSave: 0,
      wounds: 2,
      leadership: 2,
      objectiveControl: 2,
      points: [100,150],
      keywords: ['k1','k2']);
  String ljson = jsonEncode(testData.toJson());
  print(ljson);

  // JSON → Объект
  Map<String, dynamic> jsonMap = jsonDecode(ljson);
  UnitCardData decodedUnit = UnitCardData.fromJson(jsonMap);
  print(decodedUnit.unitName); // Alice
}

class Ypa extends StatelessWidget{
  const Ypa({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BaseWindow(bgColor: Colors.black38,),
    );
  }
}

