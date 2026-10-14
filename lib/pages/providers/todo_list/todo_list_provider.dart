import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/models/todo_model.dart';

import 'package:todo_app/repositories/providers/todo_repository_provider.dart';

part 'todo_list_provider.g.dart';

@riverpod
class TodoList extends _$TodoList {
  @override
  FutureOr<List<TodoModel>> build() {
    print('[TodoListProvider] intialized');
    ref.onDispose(() {
      print('[TodoListProvider] disposed');
    });

    return _getTodos();
  }

  Future<List<TodoModel>> _getTodos() {
    return ref.read(todoRepositoryProvider).getTodos();
  }

  Future<void> addTodo(String desc) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      final newTodo = TodoModel.add(desc: desc);
      await ref.read(todoRepositoryProvider).addTodo(todo: newTodo);
      return [...state.value!, newTodo];
    });
  }

  Future<void> editTodo(String id, String desc) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(todoRepositoryProvider).editTodo(id: id, desc: desc);

      return [
        for (final todo in state.value!)
          if (todo.id == id) todo.copyWith(desc: desc) else todo,
      ];
    });
  }

  Future<void> toggleTodo(String id) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      return [
        for (final todo in state.value!)
          if (todo.id == id)
            todo.copyWith(completed: !todo.completed)
          else
            todo,
      ];
    });
  }

  Future<void> removeTodo(String id) async {
    state = AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(todoRepositoryProvider).removeTodo(id: id);

      return [
        for (final todo in state.value!)
          if (todo.id != id) todo,
      ];
    });
  }
}
