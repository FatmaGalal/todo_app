import 'package:todo_app/models/todo_model.dart';

abstract class TodoRepository {
  Future<List<TodoModel>> getTodos();
  Future<void> addTodo({required TodoModel todo});
  Future<void> editTodo({required String id, required String desc});
  Future<void> toggleTodo({required String id});
  Future<void> removeTodo({required String id});
}
