// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionState {

 ETransactionState get eTransactionState; List<TransactionModel> get transactions; bool get isIncomeAddInBudget; PageMeta get pageMeta; String? get message; TransactionType? get selectedTransactionType; int? get selectedCategoryId; int? get selectedBudgetId; DateTime? get selectedDate;
/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionStateCopyWith<TransactionState> get copyWith => _$TransactionStateCopyWithImpl<TransactionState>(this as TransactionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionState&&(identical(other.eTransactionState, eTransactionState) || other.eTransactionState == eTransactionState)&&const DeepCollectionEquality().equals(other.transactions, transactions)&&(identical(other.isIncomeAddInBudget, isIncomeAddInBudget) || other.isIncomeAddInBudget == isIncomeAddInBudget)&&(identical(other.pageMeta, pageMeta) || other.pageMeta == pageMeta)&&(identical(other.message, message) || other.message == message)&&(identical(other.selectedTransactionType, selectedTransactionType) || other.selectedTransactionType == selectedTransactionType)&&(identical(other.selectedCategoryId, selectedCategoryId) || other.selectedCategoryId == selectedCategoryId)&&(identical(other.selectedBudgetId, selectedBudgetId) || other.selectedBudgetId == selectedBudgetId)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate));
}


@override
int get hashCode => Object.hash(runtimeType,eTransactionState,const DeepCollectionEquality().hash(transactions),isIncomeAddInBudget,pageMeta,message,selectedTransactionType,selectedCategoryId,selectedBudgetId,selectedDate);

@override
String toString() {
  return 'TransactionState(eTransactionState: $eTransactionState, transactions: $transactions, isIncomeAddInBudget: $isIncomeAddInBudget, pageMeta: $pageMeta, message: $message, selectedTransactionType: $selectedTransactionType, selectedCategoryId: $selectedCategoryId, selectedBudgetId: $selectedBudgetId, selectedDate: $selectedDate)';
}


}

/// @nodoc
abstract mixin class $TransactionStateCopyWith<$Res>  {
  factory $TransactionStateCopyWith(TransactionState value, $Res Function(TransactionState) _then) = _$TransactionStateCopyWithImpl;
@useResult
$Res call({
 ETransactionState eTransactionState, List<TransactionModel> transactions, bool isIncomeAddInBudget, PageMeta pageMeta, String? message, TransactionType? selectedTransactionType, int? selectedCategoryId, int? selectedBudgetId, DateTime? selectedDate
});


$PageMetaCopyWith<$Res> get pageMeta;

}
/// @nodoc
class _$TransactionStateCopyWithImpl<$Res>
    implements $TransactionStateCopyWith<$Res> {
  _$TransactionStateCopyWithImpl(this._self, this._then);

  final TransactionState _self;
  final $Res Function(TransactionState) _then;

/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? eTransactionState = null,Object? transactions = null,Object? isIncomeAddInBudget = null,Object? pageMeta = null,Object? message = freezed,Object? selectedTransactionType = freezed,Object? selectedCategoryId = freezed,Object? selectedBudgetId = freezed,Object? selectedDate = freezed,}) {
  return _then(_self.copyWith(
eTransactionState: null == eTransactionState ? _self.eTransactionState : eTransactionState // ignore: cast_nullable_to_non_nullable
as ETransactionState,transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionModel>,isIncomeAddInBudget: null == isIncomeAddInBudget ? _self.isIncomeAddInBudget : isIncomeAddInBudget // ignore: cast_nullable_to_non_nullable
as bool,pageMeta: null == pageMeta ? _self.pageMeta : pageMeta // ignore: cast_nullable_to_non_nullable
as PageMeta,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,selectedTransactionType: freezed == selectedTransactionType ? _self.selectedTransactionType : selectedTransactionType // ignore: cast_nullable_to_non_nullable
as TransactionType?,selectedCategoryId: freezed == selectedCategoryId ? _self.selectedCategoryId : selectedCategoryId // ignore: cast_nullable_to_non_nullable
as int?,selectedBudgetId: freezed == selectedBudgetId ? _self.selectedBudgetId : selectedBudgetId // ignore: cast_nullable_to_non_nullable
as int?,selectedDate: freezed == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageMetaCopyWith<$Res> get pageMeta {
  
  return $PageMetaCopyWith<$Res>(_self.pageMeta, (value) {
    return _then(_self.copyWith(pageMeta: value));
  });
}
}


/// Adds pattern-matching-related methods to [TransactionState].
extension TransactionStatePatterns on TransactionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionState value)  $default,){
final _that = this;
switch (_that) {
case _TransactionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionState value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ETransactionState eTransactionState,  List<TransactionModel> transactions,  bool isIncomeAddInBudget,  PageMeta pageMeta,  String? message,  TransactionType? selectedTransactionType,  int? selectedCategoryId,  int? selectedBudgetId,  DateTime? selectedDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionState() when $default != null:
return $default(_that.eTransactionState,_that.transactions,_that.isIncomeAddInBudget,_that.pageMeta,_that.message,_that.selectedTransactionType,_that.selectedCategoryId,_that.selectedBudgetId,_that.selectedDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ETransactionState eTransactionState,  List<TransactionModel> transactions,  bool isIncomeAddInBudget,  PageMeta pageMeta,  String? message,  TransactionType? selectedTransactionType,  int? selectedCategoryId,  int? selectedBudgetId,  DateTime? selectedDate)  $default,) {final _that = this;
switch (_that) {
case _TransactionState():
return $default(_that.eTransactionState,_that.transactions,_that.isIncomeAddInBudget,_that.pageMeta,_that.message,_that.selectedTransactionType,_that.selectedCategoryId,_that.selectedBudgetId,_that.selectedDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ETransactionState eTransactionState,  List<TransactionModel> transactions,  bool isIncomeAddInBudget,  PageMeta pageMeta,  String? message,  TransactionType? selectedTransactionType,  int? selectedCategoryId,  int? selectedBudgetId,  DateTime? selectedDate)?  $default,) {final _that = this;
switch (_that) {
case _TransactionState() when $default != null:
return $default(_that.eTransactionState,_that.transactions,_that.isIncomeAddInBudget,_that.pageMeta,_that.message,_that.selectedTransactionType,_that.selectedCategoryId,_that.selectedBudgetId,_that.selectedDate);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionState implements TransactionState {
   _TransactionState({this.eTransactionState = ETransactionState.initial, final  List<TransactionModel> transactions = const [], this.isIncomeAddInBudget = false, required this.pageMeta, this.message, this.selectedTransactionType, this.selectedCategoryId, this.selectedBudgetId, this.selectedDate}): _transactions = transactions;
  

@override@JsonKey() final  ETransactionState eTransactionState;
 final  List<TransactionModel> _transactions;
@override@JsonKey() List<TransactionModel> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}

@override@JsonKey() final  bool isIncomeAddInBudget;
@override final  PageMeta pageMeta;
@override final  String? message;
@override final  TransactionType? selectedTransactionType;
@override final  int? selectedCategoryId;
@override final  int? selectedBudgetId;
@override final  DateTime? selectedDate;

/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionStateCopyWith<_TransactionState> get copyWith => __$TransactionStateCopyWithImpl<_TransactionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionState&&(identical(other.eTransactionState, eTransactionState) || other.eTransactionState == eTransactionState)&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&(identical(other.isIncomeAddInBudget, isIncomeAddInBudget) || other.isIncomeAddInBudget == isIncomeAddInBudget)&&(identical(other.pageMeta, pageMeta) || other.pageMeta == pageMeta)&&(identical(other.message, message) || other.message == message)&&(identical(other.selectedTransactionType, selectedTransactionType) || other.selectedTransactionType == selectedTransactionType)&&(identical(other.selectedCategoryId, selectedCategoryId) || other.selectedCategoryId == selectedCategoryId)&&(identical(other.selectedBudgetId, selectedBudgetId) || other.selectedBudgetId == selectedBudgetId)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate));
}


@override
int get hashCode => Object.hash(runtimeType,eTransactionState,const DeepCollectionEquality().hash(_transactions),isIncomeAddInBudget,pageMeta,message,selectedTransactionType,selectedCategoryId,selectedBudgetId,selectedDate);

@override
String toString() {
  return 'TransactionState(eTransactionState: $eTransactionState, transactions: $transactions, isIncomeAddInBudget: $isIncomeAddInBudget, pageMeta: $pageMeta, message: $message, selectedTransactionType: $selectedTransactionType, selectedCategoryId: $selectedCategoryId, selectedBudgetId: $selectedBudgetId, selectedDate: $selectedDate)';
}


}

/// @nodoc
abstract mixin class _$TransactionStateCopyWith<$Res> implements $TransactionStateCopyWith<$Res> {
  factory _$TransactionStateCopyWith(_TransactionState value, $Res Function(_TransactionState) _then) = __$TransactionStateCopyWithImpl;
@override @useResult
$Res call({
 ETransactionState eTransactionState, List<TransactionModel> transactions, bool isIncomeAddInBudget, PageMeta pageMeta, String? message, TransactionType? selectedTransactionType, int? selectedCategoryId, int? selectedBudgetId, DateTime? selectedDate
});


@override $PageMetaCopyWith<$Res> get pageMeta;

}
/// @nodoc
class __$TransactionStateCopyWithImpl<$Res>
    implements _$TransactionStateCopyWith<$Res> {
  __$TransactionStateCopyWithImpl(this._self, this._then);

  final _TransactionState _self;
  final $Res Function(_TransactionState) _then;

/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? eTransactionState = null,Object? transactions = null,Object? isIncomeAddInBudget = null,Object? pageMeta = null,Object? message = freezed,Object? selectedTransactionType = freezed,Object? selectedCategoryId = freezed,Object? selectedBudgetId = freezed,Object? selectedDate = freezed,}) {
  return _then(_TransactionState(
eTransactionState: null == eTransactionState ? _self.eTransactionState : eTransactionState // ignore: cast_nullable_to_non_nullable
as ETransactionState,transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionModel>,isIncomeAddInBudget: null == isIncomeAddInBudget ? _self.isIncomeAddInBudget : isIncomeAddInBudget // ignore: cast_nullable_to_non_nullable
as bool,pageMeta: null == pageMeta ? _self.pageMeta : pageMeta // ignore: cast_nullable_to_non_nullable
as PageMeta,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,selectedTransactionType: freezed == selectedTransactionType ? _self.selectedTransactionType : selectedTransactionType // ignore: cast_nullable_to_non_nullable
as TransactionType?,selectedCategoryId: freezed == selectedCategoryId ? _self.selectedCategoryId : selectedCategoryId // ignore: cast_nullable_to_non_nullable
as int?,selectedBudgetId: freezed == selectedBudgetId ? _self.selectedBudgetId : selectedBudgetId // ignore: cast_nullable_to_non_nullable
as int?,selectedDate: freezed == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageMetaCopyWith<$Res> get pageMeta {
  
  return $PageMetaCopyWith<$Res>(_self.pageMeta, (value) {
    return _then(_self.copyWith(pageMeta: value));
  });
}
}

// dart format on
