// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 EState get eState; String? get message; PageMeta get pageMeta; List<CategoryModel> get categories; CategoryModel? get category; int? get selectedBudgetId;
/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryStateCopyWith<CategoryState> get copyWith => _$CategoryStateCopyWithImpl<CategoryState>(this as CategoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryState&&(identical(other.eState, eState) || other.eState == eState)&&(identical(other.message, message) || other.message == message)&&(identical(other.pageMeta, pageMeta) || other.pageMeta == pageMeta)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.category, category) || other.category == category)&&(identical(other.selectedBudgetId, selectedBudgetId) || other.selectedBudgetId == selectedBudgetId));
}


@override
int get hashCode => Object.hash(runtimeType,eState,message,pageMeta,const DeepCollectionEquality().hash(categories),category,selectedBudgetId);

@override
String toString() {
  return 'CategoryState(eState: $eState, message: $message, pageMeta: $pageMeta, categories: $categories, category: $category, selectedBudgetId: $selectedBudgetId)';
}


}

/// @nodoc
abstract mixin class $CategoryStateCopyWith<$Res>  {
  factory $CategoryStateCopyWith(CategoryState value, $Res Function(CategoryState) _then) = _$CategoryStateCopyWithImpl;
@useResult
$Res call({
 EState eState, String? message, PageMeta pageMeta, List<CategoryModel> categories, CategoryModel? category, int? selectedBudgetId
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
@pragma('vm:prefer-inline') @override $Res call({Object? eState = null,Object? message = freezed,Object? pageMeta = null,Object? categories = null,Object? category = freezed,Object? selectedBudgetId = freezed,}) {
  return _then(_self.copyWith(
eState: null == eState ? _self.eState : eState // ignore: cast_nullable_to_non_nullable
as EState,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,pageMeta: null == pageMeta ? _self.pageMeta : pageMeta // ignore: cast_nullable_to_non_nullable
as PageMeta,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel?,selectedBudgetId: freezed == selectedBudgetId ? _self.selectedBudgetId : selectedBudgetId // ignore: cast_nullable_to_non_nullable
as int?,
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


/// Adds pattern-matching-related methods to [CategoryState].
extension CategoryStatePatterns on CategoryState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryState value)  $default,){
final _that = this;
switch (_that) {
case _CategoryState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryState value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EState eState,  String? message,  PageMeta pageMeta,  List<CategoryModel> categories,  CategoryModel? category,  int? selectedBudgetId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryState() when $default != null:
return $default(_that.eState,_that.message,_that.pageMeta,_that.categories,_that.category,_that.selectedBudgetId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EState eState,  String? message,  PageMeta pageMeta,  List<CategoryModel> categories,  CategoryModel? category,  int? selectedBudgetId)  $default,) {final _that = this;
switch (_that) {
case _CategoryState():
return $default(_that.eState,_that.message,_that.pageMeta,_that.categories,_that.category,_that.selectedBudgetId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EState eState,  String? message,  PageMeta pageMeta,  List<CategoryModel> categories,  CategoryModel? category,  int? selectedBudgetId)?  $default,) {final _that = this;
switch (_that) {
case _CategoryState() when $default != null:
return $default(_that.eState,_that.message,_that.pageMeta,_that.categories,_that.category,_that.selectedBudgetId);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryState implements CategoryState {
   _CategoryState({this.eState = EState.initial, this.message, required this.pageMeta, final  List<CategoryModel> categories = const [], this.category, this.selectedBudgetId}): _categories = categories;
  

@override@JsonKey() final  EState eState;
@override final  String? message;
@override final  PageMeta pageMeta;
 final  List<CategoryModel> _categories;
@override@JsonKey() List<CategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override final  CategoryModel? category;
@override final  int? selectedBudgetId;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryStateCopyWith<_CategoryState> get copyWith => __$CategoryStateCopyWithImpl<_CategoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryState&&(identical(other.eState, eState) || other.eState == eState)&&(identical(other.message, message) || other.message == message)&&(identical(other.pageMeta, pageMeta) || other.pageMeta == pageMeta)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.category, category) || other.category == category)&&(identical(other.selectedBudgetId, selectedBudgetId) || other.selectedBudgetId == selectedBudgetId));
}


@override
int get hashCode => Object.hash(runtimeType,eState,message,pageMeta,const DeepCollectionEquality().hash(_categories),category,selectedBudgetId);

@override
String toString() {
  return 'CategoryState(eState: $eState, message: $message, pageMeta: $pageMeta, categories: $categories, category: $category, selectedBudgetId: $selectedBudgetId)';
}


}

/// @nodoc
abstract mixin class _$CategoryStateCopyWith<$Res> implements $CategoryStateCopyWith<$Res> {
  factory _$CategoryStateCopyWith(_CategoryState value, $Res Function(_CategoryState) _then) = __$CategoryStateCopyWithImpl;
@override @useResult
$Res call({
 EState eState, String? message, PageMeta pageMeta, List<CategoryModel> categories, CategoryModel? category, int? selectedBudgetId
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
@override @pragma('vm:prefer-inline') $Res call({Object? eState = null,Object? message = freezed,Object? pageMeta = null,Object? categories = null,Object? category = freezed,Object? selectedBudgetId = freezed,}) {
  return _then(_CategoryState(
eState: null == eState ? _self.eState : eState // ignore: cast_nullable_to_non_nullable
as EState,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,pageMeta: null == pageMeta ? _self.pageMeta : pageMeta // ignore: cast_nullable_to_non_nullable
as PageMeta,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel?,selectedBudgetId: freezed == selectedBudgetId ? _self.selectedBudgetId : selectedBudgetId // ignore: cast_nullable_to_non_nullable
as int?,
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
