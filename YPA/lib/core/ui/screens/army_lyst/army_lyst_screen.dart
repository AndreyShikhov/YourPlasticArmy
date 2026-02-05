/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ypa/core/ui/screens/army_lyst/army_list_item_ui.dart';
import 'package:ypa/core/ui/screens/army_lyst/army_lyst_controller.dart';
import 'package:ypa/core/ui/screens/army_lyst/widgets/create_army_dialog.dart';

import '../../widgets/confirm_dialog.dart';
import '../data/style_data.dart';

class ArmyListScreen extends ConsumerStatefulWidget
{
    const ArmyListScreen({super.key});

    @override
    ConsumerState<ArmyListScreen> createState() => _ArmyListScreenState();
}

class _ArmyListScreenState extends ConsumerState<ArmyListScreen>
{
    late final ScrollController _scrollController;

    @override
    void initState()
    {
        super.initState();
        _scrollController = ScrollController();
    }

    @override
    void dispose()
    {
        _scrollController.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context)
    {
        /// Слушаем только флаги загрузки и ошибки, а также сам список
        final isLoading = ref.watch(armyLystControllerProvider.select((s) => s.isLoading));
        final error = ref.watch(armyLystControllerProvider.select((s) => s.error));
        final items = ref.watch(armyLystControllerProvider.select((s) => s.items));

        return Scaffold(
            appBar: AppBar(title: const Text('Army list')),
            body: isLoading
                ? const Center(child: CircularProgressIndicator())
                : error != null
                    ? Center(child: Text('Error: $error'))
                    : Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                SizedBox(
                                    height: 400,
                                    width: 350,
                                    child: Scrollbar(
                                        controller: _scrollController,
                                        thumbVisibility: true,
                                        child: ListView.builder(
                                            controller: _scrollController,
                                            itemCount: items.length,
                                            padding: const EdgeInsets.only(right: 15),
                                            itemBuilder: (context, index)
                                            {
                                                return ArmyListItem(item: items[index]);
                                            }
                                        )
                                    )
                                ),
                                const SizedBox(height: 20),
                                _buildAddButton(context)
                            ]
                        )
                    )
        );
    }

    Widget _buildAddButton(BuildContext context)
    {
        return SizedBox(
            width: 300,
            height: 80,
            child: ElevatedButton(
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) => const CreateArmyDialog()
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 78, 73, 73),
                    shape: const RoundedRectangleBorder(borderRadius: ypaBorderRadius)
                ),
                child: const Text('Add new army', style: TextStyle(color: Colors.white))
            )
        );
    }
}

/// Вынесенный виджет для элемента списка (карточки армии)
class ArmyListItem extends ConsumerWidget
{
    final ArmyListItemUi item;

    const ArmyListItem({super.key, required this.item});

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
        return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
                children: [
                    /// Кнопка удаления
                    _IconButton(
                        icon: Icons.delete,
                        color: const Color.fromARGB(255, 120, 40, 40),
                        onPressed: () => _onDelete(context, ref)
                    ),
                    const SizedBox(width: 8),
                    /// Основная кнопка (Редактор)
                    Expanded(
                        child: _MainArmyButton(item: item)
                    ),
                    const SizedBox(width: 8),
                    /// Кнопка просмотра
                    _IconButton(
                        icon: Icons.visibility,
                        color: const Color.fromARGB(174, 46, 210, 34),
                        onPressed: () => context.push('/game_screen/army_lyst/view_army/${item.id}')
                    )
                ]
            )
        );
    }

    Future<void> _onDelete(BuildContext context, WidgetRef ref) async
    {
        final confirmed = await showDialog<bool>(
            context: context,
            builder: (context) => ConfirmDialog(
                title: 'Delete Army?',
                message: 'Are you sure you want to delete "${item.title}"?'
            )
        );

        if (confirmed == true)
        {
            final notifier = ref.read(armyLystControllerProvider.notifier);
            await notifier.deleteArmy(item.id);
            await notifier.loadArmies();
        }
    }
}

/// Вспомогательный виджет для маленьких кнопок действий
class _IconButton extends StatelessWidget
{
    final IconData icon;
    final Color color;
    final VoidCallback onPressed;

    const _IconButton({required this.icon, required this.color, required this.onPressed});

    @override
    Widget build(BuildContext context)
    {
        return SizedBox(
            height: 60,
            width: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: color,
                    shape: const RoundedRectangleBorder(borderRadius: ypaBorderRadius)
                ),
                onPressed: onPressed,
                child: Icon(icon, color: Colors.white, size: 20)
            )
        );
    }
}

/// Вспомогательный виджет для центральной информационной кнопки
class _MainArmyButton extends ConsumerWidget
{
    final ArmyListItemUi item;

    const _MainArmyButton({required this.item});

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
        return SizedBox(
            height: 60,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    backgroundColor: const Color.fromARGB(255, 60, 60, 60),
                    shape: const RoundedRectangleBorder(borderRadius: ypaBorderRadius)
                ),
                onPressed: () async
                {
                    await context.push('/game_screen/army_lyst/army_builder/${item.id}');
                    ref.read(armyLystControllerProvider.notifier).loadArmies();
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(
                            '${item.codexName}: ${item.title}',
                            style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis
                        ),
                        const SizedBox(height: 2),
                        Text(
                            '${item.detachment == null ? item.detachment : "No Detachment"}  ${item.currentPts} / ${item.maxPts} pts',
                            style: const TextStyle(color: Colors.white70, fontSize: 11),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis
                        )
                    ]
                )
            )
        );
    }
}
