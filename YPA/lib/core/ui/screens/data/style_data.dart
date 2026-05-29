/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/cupertino.dart';

/// ==========================================
///  Colors
/// ==========================================

const mainScreenColor = Color.fromARGB(255, 141, 141, 141);

const texColor = Color.fromARGB(255, 190, 187, 187);

/// ==========================================
/// Borders
/// ==========================================

const double ypaBorderRadiusValue = 8;
const ypaBorderRadius = BorderRadius.all(Radius.circular(ypaBorderRadiusValue));

const ypaRadius = Radius.circular(3);

/// ==========================================
/// Enums
/// ==========================================

enum StylePosition {
  first,
  middle,
  last,
  single
}
