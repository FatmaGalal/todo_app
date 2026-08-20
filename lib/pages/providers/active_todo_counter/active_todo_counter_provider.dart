import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/pages/providers/todo_list/todo_list_provider.dart';

part 'active_todo_counter_provider.g.dart';

@riverpod
int activeTodoCount(Ref ref) {
  final todos = ref.watch(todoListProvider);
  return todos.where((todo) => !(todo.completed)).toList().length;
}
