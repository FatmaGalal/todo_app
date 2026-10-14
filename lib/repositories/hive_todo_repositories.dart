import 'dart:math';
import 'package:hive/hive.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/repositories/todo_repository.dart';

const double kPeriorityOfError = 0.05;
const int kDelayDuration = 1;

class HiveTodoRepositories extends TodoRepository {
  final Box todoBox = Hive.box('todos');
  final Random random = Random();

  Future<void> waitSeconds() {
    return Future.delayed(Duration(seconds: kDelayDuration));
  }

  @override
  Future<List<TodoModel>> getTodos() async {
    await waitSeconds();
    try {
      if (random.nextDouble() < kPeriorityOfError) {
        throw 'Fail to retrive todos';
      }
      if (todoBox.length == 0) return [];

      return [
        for (final todo in todoBox.values)
          TodoModel.fromJson(Map<String, dynamic>.from(todo)),
      ];
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> addTodo({required TodoModel todo}) async {
    await waitSeconds();
    try {
      if (random.nextDouble() < kPeriorityOfError) {
        throw 'Fail to add todo';
      }
      await todoBox.put(todo.id, todo.toJson());
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> editTodo({required String id, required String desc}) async {
    await waitSeconds();
    try {
      if (random.nextDouble() < kPeriorityOfError) {
        throw 'Fail to edit todo';
      }

      final todoMap = todoBox.get(id);
      todoMap['desc'] = desc;

      await todoBox.put(id, todoMap);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> toggleTodo({required String id}) async {
    await waitSeconds();

    try {
      if (random.nextDouble() < kPeriorityOfError) {
        throw 'Fail to toggle todo';
      }
      final todoMap = todoBox.get(id);
      todoMap['completed'] = !todoMap['completed'];
      await todoBox.put(id, todoMap);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> removeTodo({required String id}) async {
    await waitSeconds();

    try {
      if (random.nextDouble() < kPeriorityOfError) {
        throw 'Fail to remove todo';
      }
      await todoBox.delete(id);
    } catch (e) {
      throw e.toString();
    }
  }
}
