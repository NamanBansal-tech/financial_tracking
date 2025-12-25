// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryProviderHash() => r'941cbf5e3a5d8d214ef6bb99de92742917746004';

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

abstract class _$CategoryProvider
    extends BuildlessAutoDisposeNotifier<CategoryState> {
  late final WidgetRef widgetRef;
  late final CategoryModel? category;

  CategoryState build({required WidgetRef widgetRef, CategoryModel? category});
}

/// See also [CategoryProvider].
@ProviderFor(CategoryProvider)
const categoryProviderProvider = CategoryProviderFamily();

/// See also [CategoryProvider].
class CategoryProviderFamily extends Family<CategoryState> {
  /// See also [CategoryProvider].
  const CategoryProviderFamily();

  /// See also [CategoryProvider].
  CategoryProviderProvider call({
    required WidgetRef widgetRef,
    CategoryModel? category,
  }) {
    return CategoryProviderProvider(widgetRef: widgetRef, category: category);
  }

  @override
  CategoryProviderProvider getProviderOverride(
    covariant CategoryProviderProvider provider,
  ) {
    return call(widgetRef: provider.widgetRef, category: provider.category);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'categoryProviderProvider';
}

/// See also [CategoryProvider].
class CategoryProviderProvider
    extends AutoDisposeNotifierProviderImpl<CategoryProvider, CategoryState> {
  /// See also [CategoryProvider].
  CategoryProviderProvider({
    required WidgetRef widgetRef,
    CategoryModel? category,
  }) : this._internal(
         () =>
             CategoryProvider()
               ..widgetRef = widgetRef
               ..category = category,
         from: categoryProviderProvider,
         name: r'categoryProviderProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$categoryProviderHash,
         dependencies: CategoryProviderFamily._dependencies,
         allTransitiveDependencies:
             CategoryProviderFamily._allTransitiveDependencies,
         widgetRef: widgetRef,
         category: category,
       );

  CategoryProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.widgetRef,
    required this.category,
  }) : super.internal();

  final WidgetRef widgetRef;
  final CategoryModel? category;

  @override
  CategoryState runNotifierBuild(covariant CategoryProvider notifier) {
    return notifier.build(widgetRef: widgetRef, category: category);
  }

  @override
  Override overrideWith(CategoryProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: CategoryProviderProvider._internal(
        () =>
            create()
              ..widgetRef = widgetRef
              ..category = category,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        widgetRef: widgetRef,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CategoryProvider, CategoryState>
  createElement() {
    return _CategoryProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryProviderProvider &&
        other.widgetRef == widgetRef &&
        other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, widgetRef.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CategoryProviderRef on AutoDisposeNotifierProviderRef<CategoryState> {
  /// The parameter `widgetRef` of this provider.
  WidgetRef get widgetRef;

  /// The parameter `category` of this provider.
  CategoryModel? get category;
}

class _CategoryProviderProviderElement
    extends AutoDisposeNotifierProviderElement<CategoryProvider, CategoryState>
    with CategoryProviderRef {
  _CategoryProviderProviderElement(super.provider);

  @override
  WidgetRef get widgetRef => (origin as CategoryProviderProvider).widgetRef;
  @override
  CategoryModel? get category => (origin as CategoryProviderProvider).category;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
