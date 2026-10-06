/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewUnitScreen extends ConsumerWidget {

  String instanceId;

  ViewUnitScreen({
    required this.instanceId,
  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Text('ViewUnitScreen');
  }
}
