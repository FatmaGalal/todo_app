import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/models/todo_model.dart';

part 'todo_list_provider.g.dart';

@riverpod
class TodoList extends _$TodoList {
  @override
  List<TodoModel> build() {
    return [
      const TodoModel(id: '1', desc: 'Clean the room'),
      const TodoModel(id: '2', desc: 'Wash the dish'),
      const TodoModel(id: '3', desc: 'do laundry'),
    ];
  }

  void addTodo(String desc) {
    state = [...state, TodoModel.add(desc: desc)];
  }

  void editToDo(String id, String desc) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(desc: desc) else todo,
    ];
  }

  void toggleTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(completed: !todo.completed) else todo,
    ];
  }

  void removeTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id != id) todo,
    ];
  }
}
