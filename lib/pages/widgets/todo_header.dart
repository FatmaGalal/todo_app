import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/pages/providers/theme/theme_provider.dart';
import 'package:todo_app/pages/providers/theme/theme_state.dart';
import 'package:todo_app/pages/providers/todo_list/todo_list_provider.dart';
import 'package:todo_app/repositories/providers/todo_repository_provider.dart';

class TodoHeader extends ConsumerStatefulWidget {
  const TodoHeader({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoHeaderState();
}

class _TodoHeaderState extends ConsumerState<TodoHeader> {
  Widget prevTodoCountWidget = const SizedBox.shrink();

  Widget getActiveTodosCount(List<TodoModel> todos) {
    final totalCount = todos.length;
    final activeTodoCount = todos.where((todo) => !todo.completed).length;

    prevTodoCountWidget = Text(
      '$activeTodoCount/$totalCount item${activeTodoCount != 1 ? "s" : ""} left',
      style: TextStyle(fontSize: 18, color: Colors.blue[900]),
    );
    return prevTodoCountWidget;
  }

  @override
  Widget build(BuildContext context) {
    final todoListState = ref.watch(todoListProvider);
    final currentTheme = ref.watch(themeProvider);

    todoListState.maybeWhen(
      loading: () {
        context.loaderOverlay.show();
      },
      orElse: () {
        context.loaderOverlay.hide();
      },
    );
    // switch (todoListState) {
    //   case TodoListStateLoading():
    //     context.loaderOverlay.show();
    //   case _:
    //     context.loaderOverlay.hide();
    // }

    return Padding(
      padding: const EdgeInsets.all(8.0),

      child: Row(
        spacing: 10,
        children: [
          Text('Todo', style: TextStyle(fontSize: 36)),
          SizedBox(width: 40),

          todoListState.maybeWhen(
            data: (List<TodoModel> todos) => getActiveTodosCount(todos),
            orElse: () => prevTodoCountWidget,
          ),

          // switch (todoListState) {
          //   TodoListStateSuccess(todos: var todos) => getActiveTodosCount(
          //     todos,
          //   ),
          //   _ => prevTodoCountWidget,
          // },
          Row(
            children: [
              IconButton(
                icon: currentTheme.runtimeType == DarkTheme
                    ? Icon(Icons.dark_mode)
                    : Icon(Icons.light_mode),
                onPressed: () {
                  ref.read(themeProvider.notifier).toggleTheme();
                },
              ),
              IconButton(
                onPressed: () {
                  ref.invalidate(todoRepositoryProvider);
                },
                icon: Icon(Icons.refresh),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
