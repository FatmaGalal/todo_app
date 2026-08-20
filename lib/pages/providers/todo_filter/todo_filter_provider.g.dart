// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_filter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TodoFilter)
const todoFilterProvider = TodoFilterProvider._();

final class TodoFilterProvider extends $NotifierProvider<TodoFilter, Filter> {
  const TodoFilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todoFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todoFilterHash();

  @$internal
  @override
  TodoFilter create() => TodoFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Filter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Filter>(value),
    );
  }
}

String _$todoFilterHash() => r'a3f1574576b8274665b7ca9810e851b62679bcfa';

abstract class _$TodoFilter extends $Notifier<Filter> {
  Filter build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Filter, Filter>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Filter, Filter>,
              Filter,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
