/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KeywordsBloc extends StatelessWidget
{

    final List<String> keywords;
    final List<String> factionKeywords;

    const KeywordsBloc({
        super.key,
        required this.keywords,
        required this.factionKeywords
    });

    @override
    Widget build(BuildContext context)
    {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
                const Text(
                    'Keywords:',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70)
                ),
                const SizedBox(height: 4),

                _createKeywords(keywords),
                const SizedBox(height: 12),
                const Text(
                    'Faction Keywords:',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70)
                ),
                const SizedBox(height: 4),

                _createKeywords(factionKeywords)
            ]
        );
    }

    Wrap _createKeywords(List<String> keywords)
    {

        List<String> finalKeywords = keywords.map((keyword)
            {
                return keyword.toLowerCase().split(' ').map((word)
                    {
                        if (word.isEmpty) return word;
                        return word[0].toUpperCase() + word.substring(1);
                    }).join(' ');
            }).toList();

        return Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 4, /// Отступ между строками
            children: [
                for (int i = 0; i < finalKeywords.length; i++) ...[
                        Text(
                            finalKeywords[i],
                            style: const TextStyle(
                                color: CupertinoColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.normal
                            )
                        ),
                        /// Добавляем разделитель, если это не последний элемент
                        if (i < finalKeywords.length - 1)
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                                '|',
                                style: TextStyle(color: CupertinoColors.systemGrey, fontSize: 12)
                            )
                        )
                    ]
            ]
        );
    }
}
