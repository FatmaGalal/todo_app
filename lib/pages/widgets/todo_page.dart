import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:todo_app/pages/widgets/filter_todo.dart';
import 'package:todo_app/pages/widgets/new_todo.dart';
import 'package:todo_app/pages/widgets/search_todo.dart';
import 'package:todo_app/pages/widgets/show_todos.dart';
import 'package:todo_app/pages/widgets/todo_header.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LoaderOverlay(
          overlayWidgetBuilder: (_) {
            return Center(child: SpinKitFadingCircle(color: Colors.grey));
          },

          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TodoHeader(),
                NewTodo(),
                SearchTodo(),
                FilterTodo(),
                SizedBox(height: 10),
                Expanded(child: ShowTodos()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
