// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BudgetProvider)
const budgetProviderProvider = BudgetProviderFamily._();

final class BudgetProviderProvider
    extends $NotifierProvider<BudgetProvider, BudgetState> {
  const BudgetProviderProvider._({
    required BudgetProviderFamily super.from,
    required ({WidgetRef widgetRef, BudgetModel? budget}) super.argument,
  }) : super(
         retry: null,
         name: r'budgetProviderProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$budgetProviderHash();

  @override
  String toString() {
    return r'budgetProviderProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  BudgetProvider create() => BudgetProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BudgetState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BudgetState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is BudgetProviderProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$budgetProviderHash() => r'40da1e29743ed0d293fc89f26ebba7b5f58508fa';

final class BudgetProviderFamily extends $Family
    with
        $ClassFamilyOverride<
          BudgetProvider,
          BudgetState,
          BudgetState,
          BudgetState,
          ({WidgetRef widgetRef, BudgetModel? budget})
        > {
  const BudgetProviderFamily._()
    : super(
        retry: null,
        name: r'budgetProviderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BudgetProviderProvider call({
    required WidgetRef widgetRef,
    BudgetModel? budget,
  }) => BudgetProviderProvider._(
    argument: (widgetRef: widgetRef, budget: budget),
    from: this,
  );

  @override
  String toString() => r'budgetProviderProvider';
}

abstract class _$BudgetProvider extends $Notifier<BudgetState> {
  late final _$args = ref.$arg as ({WidgetRef widgetRef, BudgetModel? budget});
  WidgetRef get widgetRef => _$args.widgetRef;
  BudgetModel? get budget => _$args.budget;

  BudgetState build({required WidgetRef widgetRef, BudgetModel? budget});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(widgetRef: _$args.widgetRef, budget: _$args.budget);
    final ref = this.ref as $Ref<BudgetState, BudgetState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BudgetState, BudgetState>,
              BudgetState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
