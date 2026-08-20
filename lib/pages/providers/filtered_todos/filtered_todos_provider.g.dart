// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_todos_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(filteredTodos)
const filteredTodosProvider = FilteredTodosProvider._();

final class FilteredTodosProvider
    extends
        $FunctionalProvider<List<TodoModel>, List<TodoModel>, List<TodoModel>>
    with $Provider<List<TodoModel>> {
  const FilteredTodosProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredTodosProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredTodosHash();

  @$internal
  @override
  $ProviderElement<List<TodoModel>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<TodoModel> create(Ref ref) {
    return filteredTodos(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<TodoModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<TodoModel>>(value),
    );
  }
}

String _$filteredTodosHash() => r'48d8d5d29b2416663b444a21600f3e65e088e7b6';
