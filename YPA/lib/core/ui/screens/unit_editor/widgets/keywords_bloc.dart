/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:flutter/material.dart';

class KeywordsBloc extends StatelessWidget
{

    final List<String> keywords;
    final List<String> factionKeywords;
    KeywordsBloc({
        required this.keywords, 
        required this.factionKeywords
    });

    @override
    Widget build(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Keywords:',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70),
          ),
          const SizedBox(height: 4),
          // ЗАМЕНЯЕМ Row на Wrap
          Wrap(
            spacing: 8.0, // Отступ между элементами по горизонтали
            runSpacing: 4.0, // Отступ между строками по вертикали
            children: _getKeywords(),
          ),
          const SizedBox(height: 12),
          const Text(
            'Faction Keywords:',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70),
          ),
          const SizedBox(height: 4),
          // ЗАМЕНЯЕМ Row на Wrap
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: _getFactionKeywords(),
          ),
        ],
      );
    }

    List<Widget> _getKeywords() {
      return keywords.map((keyword) => _buildKeywordChip(keyword)).toList();
    }

    List<Widget> _getFactionKeywords() {
      return factionKeywords.map((keyword) => _buildKeywordChip(keyword)).toList();
    }

    // Вспомогательный метод для красивого отображения ключевого слова
    Widget _buildKeywordChip(String text, ) {
      return Text(
        text.toUpperCase(),
        style: TextStyle(
          color:  Colors.white,
          fontSize: 12,
          letterSpacing: 0.5,
        ),
      );
    }
}