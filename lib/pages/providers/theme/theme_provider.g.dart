// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Theme)
const themeProvider = ThemeProvider._();

final class ThemeProvider extends $NotifierProvider<Theme, AppTheme> {
  const ThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeHash();

  @$internal
  @override
  Theme create() => Theme();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppTheme>(value),
    );
  }
}

String _$themeHash() => r'd80c0e4469f3ae1b80f14a77ef3dd7b37dde89ce';

abstract class _$Theme extends $Notifier<AppTheme> {
  AppTheme build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AppTheme, AppTheme>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppTheme, AppTheme>,
              AppTheme,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
