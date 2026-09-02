// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(todoItem)
const todoItemProvider = TodoItemProvider._();

final class TodoItemProvider
    extends $FunctionalProvider<TodoModel, TodoModel, TodoModel>
    with $Provider<TodoModel> {
  const TodoItemProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todoItemProvider',
        isAutoDispose: true,
        dependencies: const <ProviderOrFamily>[],
        $allTransitiveDependencies: const <ProviderOrFamily>[],
      );

  @override
  String debugGetCreateSourceHash() => _$todoItemHash();

  @$internal
  @override
  $ProviderElement<TodoModel> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TodoModel create(Ref ref) {
    return todoItem(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TodoModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TodoModel>(value),
    );
  }
}

String _$todoItemHash() => r'a03790e23cd4a6c8d84c3ad8a6215d88bbb2f55f';
