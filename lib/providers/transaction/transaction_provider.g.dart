// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$transactionProviderHash() =>
    r'd79392867f2ebeadb29a6e4f43bb2a84e75cfd5c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$TransactionProvider
    extends BuildlessAutoDisposeNotifier<TransactionState> {
  late final WidgetRef widgetRef;
  late final TransactionModel? transaction;

  TransactionState build({
    required WidgetRef widgetRef,
    TransactionModel? transaction,
  });
}

/// See also [TransactionProvider].
@ProviderFor(TransactionProvider)
const transactionProviderProvider = TransactionProviderFamily();

/// See also [TransactionProvider].
class TransactionProviderFamily extends Family<TransactionState> {
  /// See also [TransactionProvider].
  const TransactionProviderFamily();

  /// See also [TransactionProvider].
  TransactionProviderProvider call({
    required WidgetRef widgetRef,
    TransactionModel? transaction,
  }) {
    return TransactionProviderProvider(
      widgetRef: widgetRef,
      transaction: transaction,
    );
  }

  @override
  TransactionProviderProvider getProviderOverride(
    covariant TransactionProviderProvider provider,
  ) {
    return call(
      widgetRef: provider.widgetRef,
      transaction: provider.transaction,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'transactionProviderProvider';
}

/// See also [TransactionProvider].
class TransactionProviderProvider
    extends
        AutoDisposeNotifierProviderImpl<TransactionProvider, TransactionState> {
  /// See also [TransactionProvider].
  TransactionProviderProvider({
    required WidgetRef widgetRef,
    TransactionModel? transaction,
  }) : this._internal(
         () =>
             TransactionProvider()
               ..widgetRef = widgetRef
               ..transaction = transaction,
         from: transactionProviderProvider,
         name: r'transactionProviderProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$transactionProviderHash,
         dependencies: TransactionProviderFamily._dependencies,
         allTransitiveDependencies:
             TransactionProviderFamily._allTransitiveDependencies,
         widgetRef: widgetRef,
         transaction: transaction,
       );

  TransactionProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.widgetRef,
    required this.transaction,
  }) : super.internal();

  final WidgetRef widgetRef;
  final TransactionModel? transaction;

  @override
  TransactionState runNotifierBuild(covariant TransactionProvider notifier) {
    return notifier.build(widgetRef: widgetRef, transaction: transaction);
  }

  @override
  Override overrideWith(TransactionProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: TransactionProviderProvider._internal(
        () =>
            create()
              ..widgetRef = widgetRef
              ..transaction = transaction,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        widgetRef: widgetRef,
        transaction: transaction,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<TransactionProvider, TransactionState>
  createElement() {
    return _TransactionProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TransactionProviderProvider &&
        other.widgetRef == widgetRef &&
        other.transaction == transaction;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, widgetRef.hashCode);
    hash = _SystemHash.combine(hash, transaction.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TransactionProviderRef
    on AutoDisposeNotifierProviderRef<TransactionState> {
  /// The parameter `widgetRef` of this provider.
  WidgetRef get widgetRef;

  /// The parameter `transaction` of this provider.
  TransactionModel? get transaction;
}

class _TransactionProviderProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          TransactionProvider,
          TransactionState
        >
    with TransactionProviderRef {
  _TransactionProviderProviderElement(super.provider);

  @override
  WidgetRef get widgetRef => (origin as TransactionProviderProvider).widgetRef;
  @override
  TransactionModel? get transaction =>
      (origin as TransactionProviderProvider).transaction;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
