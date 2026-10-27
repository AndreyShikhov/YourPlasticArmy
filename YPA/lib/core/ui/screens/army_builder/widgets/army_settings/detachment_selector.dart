/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../domain/models/detachment/detachment.dart';
import '../../army_builder_controller.dart';

class DetachmentSelector extends ConsumerStatefulWidget
{
    final String armyId;

    const DetachmentSelector({
        super.key,
        required this.armyId
    });

    @override
    ConsumerState<DetachmentSelector> createState() => _DetachmentSelectorState();
}

class _DetachmentSelectorState extends ConsumerState<DetachmentSelector>
{
    late final Set<String> _selectedDetachmentIds;

    @override
    void initState()
    {
        super.initState();

        final selectedDetachment = ref
            .read(armyBuilderControllerProvider(widget.armyId))
            .selectedDetachment;

        _selectedDetachmentIds =
        {
            if (selectedDetachment != null) selectedDetachment.id.value
        };
    }

    @override
    Widget build(BuildContext context)
    {
        final allDetachments = ref.watch(
            armyBuilderControllerProvider(widget.armyId)
                .select((state) => state.allDetachments)
        );

        final selectedNames = allDetachments
            .where((detachment) => _selectedDetachmentIds.contains(detachment.id.value))
            .map((detachment) => detachment.name.value)
            .join(', ');

        return LayoutBuilder(
            builder: (context, constraints)
            {
                final menuWidth = constraints.maxWidth.isFinite && constraints.maxWidth > 0
                    ? constraints.maxWidth
                    : MediaQuery.sizeOf(context).width - 32;

                final menuHeight = math.min(
                    math.max(allDetachments.length, 1) * 56.0,
                    280.0
                );

                return SizedBox(
                    width: menuWidth,
                    child: MenuAnchor(
                        menuChildren: [
                            SizedBox(
                                width: menuWidth,
                                height: menuHeight,
                                child: allDetachments.isEmpty
                                    ? const Center(
                                        child: Text(
                                            'No detachments available',
                                            style: TextStyle(color: Colors.white70)
                                        )
                                    )
                                    : ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemExtent: 56,
                                        itemCount: allDetachments.length,
                                        itemBuilder: (context, index)
                                        {
                                            final detachment = allDetachments[index];

                                            return DetachmentBlock(
                                                detachment: detachment,
                                                isSelected: _selectedDetachmentIds
                                                    .contains(detachment.id.value),
                                                onSelected: (checked)
                                                {
                                                    setState(()
                                                        {
                                                            if (checked == true)
                                                            {
                                                                _selectedDetachmentIds.add(
                                                                    detachment.id.value
                                                                );
                                                            }
                                                            else
                                                            {
                                                                _selectedDetachmentIds.remove(
                                                                    detachment.id.value
                                                                );
                                                            }
                                                        });
                                                },
                                                onDescriptionPressed: () {}
                                            );
                                        }
                                    )
                            )
                        ],
                        builder: (context, controller, child)
                        {
                            final isOpen = controller.isOpen;

                            return InkWell(
                                onTap: () => isOpen
                                    ? controller.close()
                                    : controller.open(),
                                child: InputDecorator(
                                    isEmpty: selectedNames.isEmpty,
                                    decoration: InputDecoration(
                                        labelText: 'Select Detachment',
                                        labelStyle: const TextStyle(color: Colors.white70),
                                        enabledBorder: const UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white24)
                                        ),
                                        suffixIcon: Icon(
                                            isOpen
                                                ? Icons.arrow_drop_up
                                                : Icons.arrow_drop_down
                                        )
                                    ),
                                    child: Text(
                                        selectedNames,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(color: Colors.white)
                                    )
                                )
                            );
                        }
                    )
                );
            }
        );
    }
}

class DetachmentBlock extends StatelessWidget
{
    final DetachmentDOM detachment;
    final bool isSelected;
    final ValueChanged<bool?> onSelected;
    final VoidCallback? onDescriptionPressed;

    const DetachmentBlock({
        super.key,
        required this.detachment,
        required this.isSelected,
        required this.onSelected,
        this.onDescriptionPressed
    });

    @override
    Widget build(BuildContext context)
    {
        return Row(
            children: [
                Checkbox(
                    value: isSelected,
                    onChanged: onSelected
                ),
                Expanded(
                    child: Text(
                        detachment.name.value,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis
                    )
                ),
                IconButton(
                    icon: const Icon(Icons.info_outline),
                    onPressed: onDescriptionPressed
                )
            ]
        );
    }
}
