import 'dart:math';

import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/repositories/todo_repository.dart';

final intialTodo = [
  {"id": '1', 'desc': 'Clean the room', "completed": false},
  {"id": '2', "desc": 'Wash the dish', "completed": false},
  {"id": '3', "desc": 'Do homework', "completed": false},
];

const double kPeriorityOfError = 0.05;
const int kDelayDuration = 1;

class FakeTodoRepositories extends TodoRepository {
  List<Map<String, dynamic>> fakeTodos = intialTodo;
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
      return [for (final todo in fakeTodos) TodoModel.fromJson(todo)];
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
      fakeTodos = [...fakeTodos, todo.toJson()];
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
      fakeTodos = [
        for (final todo in fakeTodos)
          if (todo['id'] == id)
            {'id': id, 'desc': desc, 'completed': todo['completed']}
          else
            todo,
      ];
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
      fakeTodos = [
        for (final todo in fakeTodos)
          if (todo['id'] == id)
            {'id': id, 'desc': todo['desc'], 'completed': !todo['completed']}
          else
            todo,
      ];
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
      fakeTodos = [
        for (final todo in fakeTodos)
          if (todo['id'] != id) todo,
      ];
    } catch (e) {
      throw e.toString();
    }
  }
}
