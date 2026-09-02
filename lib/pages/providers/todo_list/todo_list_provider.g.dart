// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TodoList)
const todoListProvider = TodoListProvider._();

final class TodoListProvider
    extends $NotifierProvider<TodoList, List<TodoModel>> {
  const TodoListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todoListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todoListHash();

  @$internal
  @override
  TodoList create() => TodoList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<TodoModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<TodoModel>>(value),
    );
  }
}

String _$todoListHash() => r'8d75b0d21b82f912ab0d774c8acc07152ae55c28';

abstract class _$TodoList extends $Notifier<List<TodoModel>> {
  List<TodoModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<TodoModel>, List<TodoModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<TodoModel>, List<TodoModel>>,
              List<TodoModel>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
