import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/pages/providers/todo_list/todo_list_provider.dart';

class NewTodo extends ConsumerStatefulWidget {
  const NewTodo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<ConsumerStatefulWidget> {
  final newTodoController = TextEditingController();
  Widget prevWidget = SizedBox.shrink();

  @override
  void dispose() {
    newTodoController.dispose();
    super.dispose();
  }

  bool enableOrNot(AsyncValue<List<TodoModel>> state) {
    return state.when(
      data: (_) {
        prevWidget = Container();
        return true;
      },
      error: (_, _) => prevWidget is SizedBox ? false : true,
      loading: () => false,
    );

    // switch (state) {
    //   case TodoListStateFailure(error: _) when prevWidget is SizedBox:
    //   case TodoListStateLoading() || TodoListStateInitial():
    //     return false;

    //   case _:
    //     prevWidget = Container();
    //     return true;
    // }
  }

  @override
  Widget build(BuildContext context) {
    final todoListState = ref.watch(todoListProvider);
    return TextField(
      controller: newTodoController,
      decoration: const InputDecoration(labelText: 'What to do?'),
      enabled: enableOrNot(todoListState),
      onSubmitted: (String? desc) {
        if (desc != null && desc.trim().isNotEmpty) {
          ref.read(todoListProvider.notifier).addTodo(desc);
          newTodoController.clear();
        }
      },
    );
  }
}
