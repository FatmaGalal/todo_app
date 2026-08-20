// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_todo_counter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(activeTodoCount)
const activeTodoCountProvider = ActiveTodoCountProvider._();

final class ActiveTodoCountProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  const ActiveTodoCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeTodoCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeTodoCountHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return activeTodoCount(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$activeTodoCountHash() => r'c437131d7572203df810dcc916bdeeb32b04ae23';
