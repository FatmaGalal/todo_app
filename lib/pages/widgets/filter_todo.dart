import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/pages/providers/todo_filter/todo_filter_provider.dart';

class FilterTodo extends StatelessWidget {
  const FilterTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FilterButton(filter: Filter.all),
        FilterButton(filter: Filter.active),
        FilterButton(filter: Filter.completed),
      ],
    );
  }
}

class FilterButton extends ConsumerWidget {
  const FilterButton({super.key, required this.filter});
  final Filter filter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFilter = ref.watch(todoFilterProvider);
    return TextButton(
      onPressed: () {
        ref.read(todoFilterProvider.notifier).changeFilter(filter);
      },
      child: Text(
        filter == Filter.all
            ? 'All'
            : filter == Filter.active
            ? 'Active'
            : 'Completed',
        style: TextStyle(
          fontSize: 18,
          color: filter == currentFilter ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }
}
