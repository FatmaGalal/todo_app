import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/pages/providers/active_todo_counter/active_todo_counter_provider.dart';
import 'package:todo_app/pages/providers/theme/theme_provider.dart';
import 'package:todo_app/pages/providers/todo_list/todo_list_provider.dart';

class TodoHeader extends ConsumerWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTodoCounter = ref.watch(activeTodoCountProvider);
    final todos = ref.watch(todoListProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),

      child: Row(
        spacing: 10,
        children: [
          Text('Todo', style: TextStyle(fontSize: 36)),
          SizedBox(width: 40),

          Text(
            '$activeTodoCounter/${todos.length} item${activeTodoCounter != 1 ? "s" : ""} left',
            style: TextStyle(fontSize: 18, color: Colors.blue[900]),
          ),

          IconButton(
            onPressed: () {
              ref.read(themeProvider.notifier).toggleTheme();
            },
            icon: Icon(Icons.brightness_1_outlined),
          ),
        ],
      ),
    );
  }
}
