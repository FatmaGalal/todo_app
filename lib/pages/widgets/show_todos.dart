import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/pages/providers/todo_filter/todo_filter_provider.dart';
import 'package:todo_app/pages/providers/todo_item/todo_item_provider.dart';
import 'package:todo_app/pages/providers/todo_list/todo_list_provider.dart';
import 'package:todo_app/pages/providers/todo_search/todo_search_provider.dart';
import 'package:todo_app/pages/widgets/todo_item.dart';

class ShowTodos extends ConsumerStatefulWidget {
  const ShowTodos({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShowTodoState();
}

class _ShowTodoState extends ConsumerState<ShowTodos> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      ref.invalidate(todoListProvider);
    });
    super.initState();
  }

  Widget previousWideget = SizedBox.shrink();

  List<TodoModel> filterTodos(List<TodoModel> allTodos) {
    //final todoListState = ref.watch(todoListProvider);
    final filter = ref.watch(todoFilterProvider);
    final search = ref.watch(todoSearchProvider);

    List<TodoModel> tempTodos;

    tempTodos = switch (filter) {
      Filter.completed => allTodos.where((todo) => todo.completed).toList(),
      Filter.active => allTodos.where((todo) => !todo.completed).toList(),
      Filter.all => allTodos,
    };

    if (search.isNotEmpty) {
      tempTodos = tempTodos
          .where(
            (todo) => todo.desc.toLowerCase().contains(search.toLowerCase()),
          )
          .toList();
    }
    return tempTodos;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<List<TodoModel>>>(todoListProvider, (previous, next) {
      if (!next.isLoading) {
        next.whenOrNull(
          error: (error, st) {
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Error ocurred", textAlign: TextAlign.center),
                  content: Text(error.toString(), textAlign: TextAlign.center),
                );
              },
            );
          },
        );
      }
      // switch (next) {
      //   case TodoListStateFailure(error: String error):
      //     showDialog(
      //       context: context,
      //       builder: (context) {
      //         return AlertDialog(
      //           title: Text("Error ocurred"),
      //           content: Text(error, textAlign: TextAlign.center),
      //         );
      //       },
      //     );
      //   case _:
      // }
    });
    final todoListState = ref.watch(todoListProvider);
    return todoListState.when(
      data: (List<TodoModel> allTodos) {
        final filteredTodos = filterTodos(allTodos);
        if (filteredTodos.isEmpty) {
          return const Center(
            child: Text('Enter some Todos', style: TextStyle(fontSize: 20)),
          );
        }

        previousWideget = ListView.separated(
          itemCount: filteredTodos.length,
          separatorBuilder: (_, _) => const Divider(color: Colors.grey),

          itemBuilder: (_, int index) {
            final todo = filteredTodos[index];
            return ProviderScope(
              overrides: [todoItemProvider.overrideWithValue(todo)],
              child: const TodoItem(),
            );
          },
        );
        return previousWideget;
      },
      error: (error, _) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(error.toString(), style: TextStyle(fontSize: 20)),
              OutlinedButton(
                onPressed: () {
                  ref.invalidate(todoListProvider);
                },
                child: Text('Please Retry'),
              ),
            ],
          ),
        );
      },
      loading: () {
        return previousWideget;
      },
    );
  }
}
