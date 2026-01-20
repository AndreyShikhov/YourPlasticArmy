import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/database/database_providers.dart';
import 'core/ui/router/router.dart';

void main() async {
  // 1. Обязательная инициализация биндингов перед асинхронным кодом
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Создаем контейнер для Riverpod вручную
  final container = ProviderContainer();

  // 3. Инициализируем базу данных
  // Этот вызов выполнит код внутри databaseProvider:
  // - Создаст файл БД (если нет)
  // - Проверит на пустоту
  // - Заполнит данными (seed), если нужно
  await container.read(databaseProvider.future);

  // 4. Запускаем приложение
  runApp(
    // Используем UncontrolledProviderScope, чтобы передать уже созданный контейнер
    UncontrolledProviderScope(
      container: container,
      child: const Ypa(),
    ),
  );
}


class Ypa extends StatelessWidget {
  const Ypa({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}
