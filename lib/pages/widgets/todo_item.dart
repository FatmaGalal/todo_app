import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/pages/providers/todo_item/todo_item_provider.dart';
import 'package:todo_app/pages/providers/todo_list/todo_list_provider.dart';

class TodoItem extends ConsumerWidget {
  //final TodoModel todo;

  const TodoItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(todoItemProvider);
    print('Build todoitem');
    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return ConfiirmEditDialog(todo: todo);
          },
        );
      },
      leading: Checkbox(
        value: todo.completed,
        onChanged: (bool? checked) {
          ref.read(todoListProvider.notifier).toggleTodo(todo.id);
        },
      ),
      title: Text(todo.desc, style: TextStyle(fontSize: 18)),
      trailing: IconButton(
        onPressed: () async {
          final confirmRemove = await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: Text('Delete Task'),
                content: Text('Are you sure you want to delete this task?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text('No'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text('Yes'),
                  ),
                ],
              );
            },
          );
          if (confirmRemove) {
            ref.read(todoListProvider.notifier).removeTodo(todo.id);
          }
          //
        },
        icon: Icon(Icons.delete),
      ),
    );
  }
}

class ConfiirmEditDialog extends ConsumerStatefulWidget {
  final TodoModel todo;
  const ConfiirmEditDialog({super.key, required this.todo});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ConfirmEditDialogState();
}

class _ConfirmEditDialogState extends ConsumerState<ConfiirmEditDialog> {
  late final TextEditingController textController;
  bool error = false;
  @override
  void initState() {
    textController = TextEditingController(text: widget.todo.desc);
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Task'),
      content: TextField(
        controller: textController,
        autofocus: true,
        decoration: InputDecoration(
          errorText: error ? 'Text could not be empty' : null,
        ),
      ),

      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),

        TextButton(
          onPressed: () {
            error = textController.text.trim().isEmpty ? true : false;
            if (error) {
              setState(() {
                error = true;
              });
            } else {
              ref
                  .read(todoListProvider.notifier)
                  .editTodo(widget.todo.id, textController.text);
              Navigator.pop(context);
            }
          },
          child: Text('Edit'),
        ),
      ],
    );
  }
}
