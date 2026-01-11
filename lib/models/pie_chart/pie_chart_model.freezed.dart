// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pie_chart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PieChartModel {

 num get totalBudget; String? get budgetName; List<PieChartItemModel> get items; num get totalExpense;
/// Create a copy of PieChartModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PieChartModelCopyWith<PieChartModel> get copyWith => _$PieChartModelCopyWithImpl<PieChartModel>(this as PieChartModel, _$identity);

  /// Serializes this PieChartModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PieChartModel&&(identical(other.totalBudget, totalBudget) || other.totalBudget == totalBudget)&&(identical(other.budgetName, budgetName) || other.budgetName == budgetName)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.totalExpense, totalExpense) || other.totalExpense == totalExpense));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalBudget,budgetName,const DeepCollectionEquality().hash(items),totalExpense);

@override
String toString() {
  return 'PieChartModel(totalBudget: $totalBudget, budgetName: $budgetName, items: $items, totalExpense: $totalExpense)';
}


}

/// @nodoc
abstract mixin class $PieChartModelCopyWith<$Res>  {
  factory $PieChartModelCopyWith(PieChartModel value, $Res Function(PieChartModel) _then) = _$PieChartModelCopyWithImpl;
@useResult
$Res call({
 num totalBudget, String? budgetName, List<PieChartItemModel> items, num totalExpense
});




}
/// @nodoc
class _$PieChartModelCopyWithImpl<$Res>
    implements $PieChartModelCopyWith<$Res> {
  _$PieChartModelCopyWithImpl(this._self, this._then);

  final PieChartModel _self;
  final $Res Function(PieChartModel) _then;

/// Create a copy of PieChartModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalBudget = null,Object? budgetName = freezed,Object? items = null,Object? totalExpense = null,}) {
  return _then(_self.copyWith(
totalBudget: null == totalBudget ? _self.totalBudget : totalBudget // ignore: cast_nullable_to_non_nullable
as num,budgetName: freezed == budgetName ? _self.budgetName : budgetName // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<PieChartItemModel>,totalExpense: null == totalExpense ? _self.totalExpense : totalExpense // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// Adds pattern-matching-related methods to [PieChartModel].
extension PieChartModelPatterns on PieChartModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PieChartModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PieChartModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PieChartModel value)  $default,){
final _that = this;
switch (_that) {
case _PieChartModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PieChartModel value)?  $default,){
final _that = this;
switch (_that) {
case _PieChartModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( num totalBudget,  String? budgetName,  List<PieChartItemModel> items,  num totalExpense)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PieChartModel() when $default != null:
return $default(_that.totalBudget,_that.budgetName,_that.items,_that.totalExpense);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( num totalBudget,  String? budgetName,  List<PieChartItemModel> items,  num totalExpense)  $default,) {final _that = this;
switch (_that) {
case _PieChartModel():
return $default(_that.totalBudget,_that.budgetName,_that.items,_that.totalExpense);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( num totalBudget,  String? budgetName,  List<PieChartItemModel> items,  num totalExpense)?  $default,) {final _that = this;
switch (_that) {
case _PieChartModel() when $default != null:
return $default(_that.totalBudget,_that.budgetName,_that.items,_that.totalExpense);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PieChartModel implements PieChartModel {
   _PieChartModel({this.totalBudget = 0, this.budgetName, final  List<PieChartItemModel> items = const [], this.totalExpense = 0}): _items = items;
  factory _PieChartModel.fromJson(Map<String, dynamic> json) => _$PieChartModelFromJson(json);

@override@JsonKey() final  num totalBudget;
@override final  String? budgetName;
 final  List<PieChartItemModel> _items;
@override@JsonKey() List<PieChartItemModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  num totalExpense;

/// Create a copy of PieChartModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PieChartModelCopyWith<_PieChartModel> get copyWith => __$PieChartModelCopyWithImpl<_PieChartModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PieChartModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PieChartModel&&(identical(other.totalBudget, totalBudget) || other.totalBudget == totalBudget)&&(identical(other.budgetName, budgetName) || other.budgetName == budgetName)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.totalExpense, totalExpense) || other.totalExpense == totalExpense));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalBudget,budgetName,const DeepCollectionEquality().hash(_items),totalExpense);

@override
String toString() {
  return 'PieChartModel(totalBudget: $totalBudget, budgetName: $budgetName, items: $items, totalExpense: $totalExpense)';
}


}

/// @nodoc
abstract mixin class _$PieChartModelCopyWith<$Res> implements $PieChartModelCopyWith<$Res> {
  factory _$PieChartModelCopyWith(_PieChartModel value, $Res Function(_PieChartModel) _then) = __$PieChartModelCopyWithImpl;
@override @useResult
$Res call({
 num totalBudget, String? budgetName, List<PieChartItemModel> items, num totalExpense
});




}
/// @nodoc
class __$PieChartModelCopyWithImpl<$Res>
    implements _$PieChartModelCopyWith<$Res> {
  __$PieChartModelCopyWithImpl(this._self, this._then);

  final _PieChartModel _self;
  final $Res Function(_PieChartModel) _then;

/// Create a copy of PieChartModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalBudget = null,Object? budgetName = freezed,Object? items = null,Object? totalExpense = null,}) {
  return _then(_PieChartModel(
totalBudget: null == totalBudget ? _self.totalBudget : totalBudget // ignore: cast_nullable_to_non_nullable
as num,budgetName: freezed == budgetName ? _self.budgetName : budgetName // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PieChartItemModel>,totalExpense: null == totalExpense ? _self.totalExpense : totalExpense // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}


/// @nodoc
mixin _$PieChartItemModel {

 String? get categoryName; num get totalExpense; List<TransactionModel>? get transactions;
/// Create a copy of PieChartItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PieChartItemModelCopyWith<PieChartItemModel> get copyWith => _$PieChartItemModelCopyWithImpl<PieChartItemModel>(this as PieChartItemModel, _$identity);

  /// Serializes this PieChartItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PieChartItemModel&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.totalExpense, totalExpense) || other.totalExpense == totalExpense)&&const DeepCollectionEquality().equals(other.transactions, transactions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryName,totalExpense,const DeepCollectionEquality().hash(transactions));

@override
String toString() {
  return 'PieChartItemModel(categoryName: $categoryName, totalExpense: $totalExpense, transactions: $transactions)';
}


}

/// @nodoc
abstract mixin class $PieChartItemModelCopyWith<$Res>  {
  factory $PieChartItemModelCopyWith(PieChartItemModel value, $Res Function(PieChartItemModel) _then) = _$PieChartItemModelCopyWithImpl;
@useResult
$Res call({
 String? categoryName, num totalExpense, List<TransactionModel>? transactions
});




}
/// @nodoc
class _$PieChartItemModelCopyWithImpl<$Res>
    implements $PieChartItemModelCopyWith<$Res> {
  _$PieChartItemModelCopyWithImpl(this._self, this._then);

  final PieChartItemModel _self;
  final $Res Function(PieChartItemModel) _then;

/// Create a copy of PieChartItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryName = freezed,Object? totalExpense = null,Object? transactions = freezed,}) {
  return _then(_self.copyWith(
categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,totalExpense: null == totalExpense ? _self.totalExpense : totalExpense // ignore: cast_nullable_to_non_nullable
as num,transactions: freezed == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [PieChartItemModel].
extension PieChartItemModelPatterns on PieChartItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PieChartItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PieChartItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PieChartItemModel value)  $default,){
final _that = this;
switch (_that) {
case _PieChartItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PieChartItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _PieChartItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? categoryName,  num totalExpense,  List<TransactionModel>? transactions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PieChartItemModel() when $default != null:
return $default(_that.categoryName,_that.totalExpense,_that.transactions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? categoryName,  num totalExpense,  List<TransactionModel>? transactions)  $default,) {final _that = this;
switch (_that) {
case _PieChartItemModel():
return $default(_that.categoryName,_that.totalExpense,_that.transactions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? categoryName,  num totalExpense,  List<TransactionModel>? transactions)?  $default,) {final _that = this;
switch (_that) {
case _PieChartItemModel() when $default != null:
return $default(_that.categoryName,_that.totalExpense,_that.transactions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PieChartItemModel implements PieChartItemModel {
   _PieChartItemModel({this.categoryName, this.totalExpense = 0, final  List<TransactionModel>? transactions}): _transactions = transactions;
  factory _PieChartItemModel.fromJson(Map<String, dynamic> json) => _$PieChartItemModelFromJson(json);

@override final  String? categoryName;
@override@JsonKey() final  num totalExpense;
 final  List<TransactionModel>? _transactions;
@override List<TransactionModel>? get transactions {
  final value = _transactions;
  if (value == null) return null;
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of PieChartItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PieChartItemModelCopyWith<_PieChartItemModel> get copyWith => __$PieChartItemModelCopyWithImpl<_PieChartItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PieChartItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PieChartItemModel&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.totalExpense, totalExpense) || other.totalExpense == totalExpense)&&const DeepCollectionEquality().equals(other._transactions, _transactions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryName,totalExpense,const DeepCollectionEquality().hash(_transactions));

@override
String toString() {
  return 'PieChartItemModel(categoryName: $categoryName, totalExpense: $totalExpense, transactions: $transactions)';
}


}

/// @nodoc
abstract mixin class _$PieChartItemModelCopyWith<$Res> implements $PieChartItemModelCopyWith<$Res> {
  factory _$PieChartItemModelCopyWith(_PieChartItemModel value, $Res Function(_PieChartItemModel) _then) = __$PieChartItemModelCopyWithImpl;
@override @useResult
$Res call({
 String? categoryName, num totalExpense, List<TransactionModel>? transactions
});




}
/// @nodoc
class __$PieChartItemModelCopyWithImpl<$Res>
    implements _$PieChartItemModelCopyWith<$Res> {
  __$PieChartItemModelCopyWithImpl(this._self, this._then);

  final _PieChartItemModel _self;
  final $Res Function(_PieChartItemModel) _then;

/// Create a copy of PieChartItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryName = freezed,Object? totalExpense = null,Object? transactions = freezed,}) {
  return _then(_PieChartItemModel(
categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,totalExpense: null == totalExpense ? _self.totalExpense : totalExpense // ignore: cast_nullable_to_non_nullable
as num,transactions: freezed == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionModel>?,
  ));
}


}

// dart format on
