// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryState {

 ECategoryState get eCategoryState; String? get message; BudgetPeriods? get selectedBudgetPeriod; bool get showBudgetFields; PageMeta get pageMeta; List<CategoryModel> get categories; CategoryModel? get category;
/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryStateCopyWith<CategoryState> get copyWith => _$CategoryStateCopyWithImpl<CategoryState>(this as CategoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryState&&(identical(other.eCategoryState, eCategoryState) || other.eCategoryState == eCategoryState)&&(identical(other.message, message) || other.message == message)&&(identical(other.selectedBudgetPeriod, selectedBudgetPeriod) || other.selectedBudgetPeriod == selectedBudgetPeriod)&&(identical(other.showBudgetFields, showBudgetFields) || other.showBudgetFields == showBudgetFields)&&(identical(other.pageMeta, pageMeta) || other.pageMeta == pageMeta)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,eCategoryState,message,selectedBudgetPeriod,showBudgetFields,pageMeta,const DeepCollectionEquality().hash(categories),category);

@override
String toString() {
  return 'CategoryState(eCategoryState: $eCategoryState, message: $message, selectedBudgetPeriod: $selectedBudgetPeriod, showBudgetFields: $showBudgetFields, pageMeta: $pageMeta, categories: $categories, category: $category)';
}


}

/// @nodoc
abstract mixin class $CategoryStateCopyWith<$Res>  {
  factory $CategoryStateCopyWith(CategoryState value, $Res Function(CategoryState) _then) = _$CategoryStateCopyWithImpl;
@useResult
$Res call({
 ECategoryState eCategoryState, String? message, BudgetPeriods? selectedBudgetPeriod, bool showBudgetFields, PageMeta pageMeta, List<CategoryModel> categories, CategoryModel? category
});


$PageMetaCopyWith<$Res> get pageMeta;$CategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class _$CategoryStateCopyWithImpl<$Res>
    implements $CategoryStateCopyWith<$Res> {
  _$CategoryStateCopyWithImpl(this._self, this._then);

  final CategoryState _self;
  final $Res Function(CategoryState) _then;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? eCategoryState = null,Object? message = freezed,Object? selectedBudgetPeriod = freezed,Object? showBudgetFields = null,Object? pageMeta = null,Object? categories = null,Object? category = freezed,}) {
  return _then(_self.copyWith(
eCategoryState: null == eCategoryState ? _self.eCategoryState : eCategoryState // ignore: cast_nullable_to_non_nullable
as ECategoryState,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,selectedBudgetPeriod: freezed == selectedBudgetPeriod ? _self.selectedBudgetPeriod : selectedBudgetPeriod // ignore: cast_nullable_to_non_nullable
as BudgetPeriods?,showBudgetFields: null == showBudgetFields ? _self.showBudgetFields : showBudgetFields // ignore: cast_nullable_to_non_nullable
as bool,pageMeta: null == pageMeta ? _self.pageMeta : pageMeta // ignore: cast_nullable_to_non_nullable
as PageMeta,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel?,
  ));
}
/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageMetaCopyWith<$Res> get pageMeta {
  
  return $PageMetaCopyWith<$Res>(_self.pageMeta, (value) {
    return _then(_self.copyWith(pageMeta: value));
  });
}/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// @nodoc


class _CategoryState implements CategoryState {
   _CategoryState({this.eCategoryState = ECategoryState.initial, this.message, this.selectedBudgetPeriod, this.showBudgetFields = false, required this.pageMeta, final  List<CategoryModel> categories = const [], this.category}): _categories = categories;
  

@override@JsonKey() final  ECategoryState eCategoryState;
@override final  String? message;
@override final  BudgetPeriods? selectedBudgetPeriod;
@override@JsonKey() final  bool showBudgetFields;
@override final  PageMeta pageMeta;
 final  List<CategoryModel> _categories;
@override@JsonKey() List<CategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override final  CategoryModel? category;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryStateCopyWith<_CategoryState> get copyWith => __$CategoryStateCopyWithImpl<_CategoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryState&&(identical(other.eCategoryState, eCategoryState) || other.eCategoryState == eCategoryState)&&(identical(other.message, message) || other.message == message)&&(identical(other.selectedBudgetPeriod, selectedBudgetPeriod) || other.selectedBudgetPeriod == selectedBudgetPeriod)&&(identical(other.showBudgetFields, showBudgetFields) || other.showBudgetFields == showBudgetFields)&&(identical(other.pageMeta, pageMeta) || other.pageMeta == pageMeta)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,eCategoryState,message,selectedBudgetPeriod,showBudgetFields,pageMeta,const DeepCollectionEquality().hash(_categories),category);

@override
String toString() {
  return 'CategoryState(eCategoryState: $eCategoryState, message: $message, selectedBudgetPeriod: $selectedBudgetPeriod, showBudgetFields: $showBudgetFields, pageMeta: $pageMeta, categories: $categories, category: $category)';
}


}

/// @nodoc
abstract mixin class _$CategoryStateCopyWith<$Res> implements $CategoryStateCopyWith<$Res> {
  factory _$CategoryStateCopyWith(_CategoryState value, $Res Function(_CategoryState) _then) = __$CategoryStateCopyWithImpl;
@override @useResult
$Res call({
 ECategoryState eCategoryState, String? message, BudgetPeriods? selectedBudgetPeriod, bool showBudgetFields, PageMeta pageMeta, List<CategoryModel> categories, CategoryModel? category
});


@override $PageMetaCopyWith<$Res> get pageMeta;@override $CategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class __$CategoryStateCopyWithImpl<$Res>
    implements _$CategoryStateCopyWith<$Res> {
  __$CategoryStateCopyWithImpl(this._self, this._then);

  final _CategoryState _self;
  final $Res Function(_CategoryState) _then;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? eCategoryState = null,Object? message = freezed,Object? selectedBudgetPeriod = freezed,Object? showBudgetFields = null,Object? pageMeta = null,Object? categories = null,Object? category = freezed,}) {
  return _then(_CategoryState(
eCategoryState: null == eCategoryState ? _self.eCategoryState : eCategoryState // ignore: cast_nullable_to_non_nullable
as ECategoryState,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,selectedBudgetPeriod: freezed == selectedBudgetPeriod ? _self.selectedBudgetPeriod : selectedBudgetPeriod // ignore: cast_nullable_to_non_nullable
as BudgetPeriods?,showBudgetFields: null == showBudgetFields ? _self.showBudgetFields : showBudgetFields // ignore: cast_nullable_to_non_nullable
as bool,pageMeta: null == pageMeta ? _self.pageMeta : pageMeta // ignore: cast_nullable_to_non_nullable
as PageMeta,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel?,
  ));
}

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageMetaCopyWith<$Res> get pageMeta {
  
  return $PageMetaCopyWith<$Res>(_self.pageMeta, (value) {
    return _then(_self.copyWith(pageMeta: value));
  });
}/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

// dart format on
