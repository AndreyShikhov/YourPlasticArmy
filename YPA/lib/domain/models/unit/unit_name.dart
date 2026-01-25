/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

class UnitName {
  final String value;

  const UnitName._(this.value);

  factory UnitName(String value) {
    if (value.isEmpty) {
      throw Exception('UnitName не может быть пустым');
    }
    return UnitName._(value);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is UnitName && runtimeType == other.runtimeType && value == other.value;

  @override
  int get hashCode => value.hashCode;
}
