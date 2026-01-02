// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CommonProvider)
const commonProviderProvider = CommonProviderFamily._();

final class CommonProviderProvider
    extends $NotifierProvider<CommonProvider, CommonState> {
  const CommonProviderProvider._({
    required CommonProviderFamily super.from,
    required WidgetRef super.argument,
  }) : super(
         retry: null,
         name: r'commonProviderProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$commonProviderHash();

  @override
  String toString() {
    return r'commonProviderProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CommonProvider create() => CommonProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommonState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommonState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CommonProviderProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$commonProviderHash() => r'24342b332cc9446396fe671e9afb52ecf3bb8f51';

final class CommonProviderFamily extends $Family
    with
        $ClassFamilyOverride<
          CommonProvider,
          CommonState,
          CommonState,
          CommonState,
          WidgetRef
        > {
  const CommonProviderFamily._()
    : super(
        retry: null,
        name: r'commonProviderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CommonProviderProvider call({required WidgetRef widgetRef}) =>
      CommonProviderProvider._(argument: widgetRef, from: this);

  @override
  String toString() => r'commonProviderProvider';
}

abstract class _$CommonProvider extends $Notifier<CommonState> {
  late final _$args = ref.$arg as WidgetRef;
  WidgetRef get widgetRef => _$args;

  CommonState build({required WidgetRef widgetRef});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(widgetRef: _$args);
    final ref = this.ref as $Ref<CommonState, CommonState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CommonState, CommonState>,
              CommonState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
