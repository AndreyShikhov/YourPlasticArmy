
/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */


String getRomeNumber(int arabianNumber)
{
  switch (arabianNumber)
  {
    case 1: return 'I';
    case 2: return 'II';
    case 3: return 'III';
    case 4: return 'IV';
    case 5: return 'V';
    case 6: return 'VI';
    case 7: return 'VII';
    case 8: return 'VIII';
    case 9: return 'IX';
    case 10: return 'X';
    default: return '';
  }
}