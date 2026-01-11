// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TransactionProvider)
const transactionProviderProvider = TransactionProviderFamily._();

final class TransactionProviderProvider
    extends $NotifierProvider<TransactionProvider, TransactionState> {
  const TransactionProviderProvider._({
    required TransactionProviderFamily super.from,
    required ({
      WidgetRef widgetRef,
      TransactionModel? transaction,
      bool fromFilterTransaction,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'transactionProviderProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$transactionProviderHash();

  @override
  String toString() {
    return r'transactionProviderProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  TransactionProvider create() => TransactionProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TransactionState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TransactionState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TransactionProviderProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$transactionProviderHash() =>
    r'9d26e9381066772ca37f0c1e08b7c7ede6014db2';

final class TransactionProviderFamily extends $Family
    with
        $ClassFamilyOverride<
          TransactionProvider,
          TransactionState,
          TransactionState,
          TransactionState,
          ({
            WidgetRef widgetRef,
            TransactionModel? transaction,
            bool fromFilterTransaction,
          })
        > {
  const TransactionProviderFamily._()
    : super(
        retry: null,
        name: r'transactionProviderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TransactionProviderProvider call({
    required WidgetRef widgetRef,
    TransactionModel? transaction,
    bool fromFilterTransaction = false,
  }) => TransactionProviderProvider._(
    argument: (
      widgetRef: widgetRef,
      transaction: transaction,
      fromFilterTransaction: fromFilterTransaction,
    ),
    from: this,
  );

  @override
  String toString() => r'transactionProviderProvider';
}

abstract class _$TransactionProvider extends $Notifier<TransactionState> {
  late final _$args =
      ref.$arg
          as ({
            WidgetRef widgetRef,
            TransactionModel? transaction,
            bool fromFilterTransaction,
          });
  WidgetRef get widgetRef => _$args.widgetRef;
  TransactionModel? get transaction => _$args.transaction;
  bool get fromFilterTransaction => _$args.fromFilterTransaction;

  TransactionState build({
    required WidgetRef widgetRef,
    TransactionModel? transaction,
    bool fromFilterTransaction = false,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      widgetRef: _$args.widgetRef,
      transaction: _$args.transaction,
      fromFilterTransaction: _$args.fromFilterTransaction,
    );
    final ref = this.ref as $Ref<TransactionState, TransactionState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TransactionState, TransactionState>,
              TransactionState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
