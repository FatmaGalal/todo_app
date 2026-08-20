// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TodoSearch)
const todoSearchProvider = TodoSearchProvider._();

final class TodoSearchProvider extends $NotifierProvider<TodoSearch, String> {
  const TodoSearchProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todoSearchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todoSearchHash();

  @$internal
  @override
  TodoSearch create() => TodoSearch();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$todoSearchHash() => r'509528de9a1cbbdc42a5426b7bfbf9b2c2300118';

abstract class _$TodoSearch extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
