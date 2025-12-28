// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CategoryProvider)
const categoryProviderProvider = CategoryProviderFamily._();

final class CategoryProviderProvider
    extends $NotifierProvider<CategoryProvider, CategoryState> {
  const CategoryProviderProvider._({
    required CategoryProviderFamily super.from,
    required ({WidgetRef widgetRef, CategoryModel? category}) super.argument,
  }) : super(
         retry: null,
         name: r'categoryProviderProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$categoryProviderHash();

  @override
  String toString() {
    return r'categoryProviderProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  CategoryProvider create() => CategoryProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CategoryState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CategoryState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryProviderProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$categoryProviderHash() => r'825b378756b5451654033cfbca97e8b2f6cb57ec';

final class CategoryProviderFamily extends $Family
    with
        $ClassFamilyOverride<
          CategoryProvider,
          CategoryState,
          CategoryState,
          CategoryState,
          ({WidgetRef widgetRef, CategoryModel? category})
        > {
  const CategoryProviderFamily._()
    : super(
        retry: null,
        name: r'categoryProviderProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CategoryProviderProvider call({
    required WidgetRef widgetRef,
    CategoryModel? category,
  }) => CategoryProviderProvider._(
    argument: (widgetRef: widgetRef, category: category),
    from: this,
  );

  @override
  String toString() => r'categoryProviderProvider';
}

abstract class _$CategoryProvider extends $Notifier<CategoryState> {
  late final _$args =
      ref.$arg as ({WidgetRef widgetRef, CategoryModel? category});
  WidgetRef get widgetRef => _$args.widgetRef;
  CategoryModel? get category => _$args.category;

  CategoryState build({required WidgetRef widgetRef, CategoryModel? category});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      widgetRef: _$args.widgetRef,
      category: _$args.category,
    );
    final ref = this.ref as $Ref<CategoryState, CategoryState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CategoryState, CategoryState>,
              CategoryState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
