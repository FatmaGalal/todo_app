import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/pages/providers/todo_search/todo_search_provider.dart';

class SearchTodo extends ConsumerWidget {
  const SearchTodo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Search Todo',
        border: InputBorder.none,
        prefixIcon: Icon(Icons.search),
      ),
      onChanged: (String? newSearchTerm) {
        if (newSearchTerm != null) {
          ref.read(todoSearchProvider.notifier).setSearchTerm(newSearchTerm);
        }
      },
    );
  }
}
