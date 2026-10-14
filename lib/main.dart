import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/pages/providers/theme/theme_provider.dart';
import 'package:todo_app/pages/providers/theme/theme_state.dart';
import 'package:todo_app/pages/widgets/todo_page.dart';
import 'package:todo_app/repositories/hive_todo_repositories.dart';
import 'package:todo_app/repositories/providers/todo_repository_provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('todos');
  runApp(
    ProviderScope(
      overrides: [
        todoRepositoryProvider.overrideWithValue(HiveTodoRepositories()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: switch (currentTheme) {
        LightTheme() => ThemeData.dark(useMaterial3: true),
        DarkTheme() => ThemeData.light(useMaterial3: true),
      },
      home: const TodoPage(),
    );
  }
}
