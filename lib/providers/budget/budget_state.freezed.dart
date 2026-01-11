// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BudgetState {

 EState get eState; String? get message; DateTime? get endDate; DateTime? get startDate; PageMeta get pageMeta; List<BudgetModel> get budgetList; BudgetModel? get budget; int? get resultId;
/// Create a copy of BudgetState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BudgetStateCopyWith<BudgetState> get copyWith => _$BudgetStateCopyWithImpl<BudgetState>(this as BudgetState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BudgetState&&(identical(other.eState, eState) || other.eState == eState)&&(identical(other.message, message) || other.message == message)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.pageMeta, pageMeta) || other.pageMeta == pageMeta)&&const DeepCollectionEquality().equals(other.budgetList, budgetList)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.resultId, resultId) || other.resultId == resultId));
}


@override
int get hashCode => Object.hash(runtimeType,eState,message,endDate,startDate,pageMeta,const DeepCollectionEquality().hash(budgetList),budget,resultId);

@override
String toString() {
  return 'BudgetState(eState: $eState, message: $message, endDate: $endDate, startDate: $startDate, pageMeta: $pageMeta, budgetList: $budgetList, budget: $budget, resultId: $resultId)';
}


}

/// @nodoc
abstract mixin class $BudgetStateCopyWith<$Res>  {
  factory $BudgetStateCopyWith(BudgetState value, $Res Function(BudgetState) _then) = _$BudgetStateCopyWithImpl;
@useResult
$Res call({
 EState eState, String? message, DateTime? endDate, DateTime? startDate, PageMeta pageMeta, List<BudgetModel> budgetList, BudgetModel? budget, int? resultId
});


$PageMetaCopyWith<$Res> get pageMeta;$BudgetModelCopyWith<$Res>? get budget;

}
/// @nodoc
class _$BudgetStateCopyWithImpl<$Res>
    implements $BudgetStateCopyWith<$Res> {
  _$BudgetStateCopyWithImpl(this._self, this._then);

  final BudgetState _self;
  final $Res Function(BudgetState) _then;

/// Create a copy of BudgetState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? eState = null,Object? message = freezed,Object? endDate = freezed,Object? startDate = freezed,Object? pageMeta = null,Object? budgetList = null,Object? budget = freezed,Object? resultId = freezed,}) {
  return _then(_self.copyWith(
eState: null == eState ? _self.eState : eState // ignore: cast_nullable_to_non_nullable
as EState,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,pageMeta: null == pageMeta ? _self.pageMeta : pageMeta // ignore: cast_nullable_to_non_nullable
as PageMeta,budgetList: null == budgetList ? _self.budgetList : budgetList // ignore: cast_nullable_to_non_nullable
as List<BudgetModel>,budget: freezed == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as BudgetModel?,resultId: freezed == resultId ? _self.resultId : resultId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of BudgetState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageMetaCopyWith<$Res> get pageMeta {
  
  return $PageMetaCopyWith<$Res>(_self.pageMeta, (value) {
    return _then(_self.copyWith(pageMeta: value));
  });
}/// Create a copy of BudgetState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetModelCopyWith<$Res>? get budget {
    if (_self.budget == null) {
    return null;
  }

  return $BudgetModelCopyWith<$Res>(_self.budget!, (value) {
    return _then(_self.copyWith(budget: value));
  });
}
}


/// Adds pattern-matching-related methods to [BudgetState].
extension BudgetStatePatterns on BudgetState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BudgetState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BudgetState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BudgetState value)  $default,){
final _that = this;
switch (_that) {
case _BudgetState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BudgetState value)?  $default,){
final _that = this;
switch (_that) {
case _BudgetState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EState eState,  String? message,  DateTime? endDate,  DateTime? startDate,  PageMeta pageMeta,  List<BudgetModel> budgetList,  BudgetModel? budget,  int? resultId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BudgetState() when $default != null:
return $default(_that.eState,_that.message,_that.endDate,_that.startDate,_that.pageMeta,_that.budgetList,_that.budget,_that.resultId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EState eState,  String? message,  DateTime? endDate,  DateTime? startDate,  PageMeta pageMeta,  List<BudgetModel> budgetList,  BudgetModel? budget,  int? resultId)  $default,) {final _that = this;
switch (_that) {
case _BudgetState():
return $default(_that.eState,_that.message,_that.endDate,_that.startDate,_that.pageMeta,_that.budgetList,_that.budget,_that.resultId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EState eState,  String? message,  DateTime? endDate,  DateTime? startDate,  PageMeta pageMeta,  List<BudgetModel> budgetList,  BudgetModel? budget,  int? resultId)?  $default,) {final _that = this;
switch (_that) {
case _BudgetState() when $default != null:
return $default(_that.eState,_that.message,_that.endDate,_that.startDate,_that.pageMeta,_that.budgetList,_that.budget,_that.resultId);case _:
  return null;

}
}

}

/// @nodoc


class _BudgetState implements BudgetState {
   _BudgetState({this.eState = EState.initial, this.message, this.endDate, this.startDate, required this.pageMeta, final  List<BudgetModel> budgetList = const [], this.budget, this.resultId}): _budgetList = budgetList;
  

@override@JsonKey() final  EState eState;
@override final  String? message;
@override final  DateTime? endDate;
@override final  DateTime? startDate;
@override final  PageMeta pageMeta;
 final  List<BudgetModel> _budgetList;
@override@JsonKey() List<BudgetModel> get budgetList {
  if (_budgetList is EqualUnmodifiableListView) return _budgetList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_budgetList);
}

@override final  BudgetModel? budget;
@override final  int? resultId;

/// Create a copy of BudgetState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BudgetStateCopyWith<_BudgetState> get copyWith => __$BudgetStateCopyWithImpl<_BudgetState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BudgetState&&(identical(other.eState, eState) || other.eState == eState)&&(identical(other.message, message) || other.message == message)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.pageMeta, pageMeta) || other.pageMeta == pageMeta)&&const DeepCollectionEquality().equals(other._budgetList, _budgetList)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.resultId, resultId) || other.resultId == resultId));
}


@override
int get hashCode => Object.hash(runtimeType,eState,message,endDate,startDate,pageMeta,const DeepCollectionEquality().hash(_budgetList),budget,resultId);

@override
String toString() {
  return 'BudgetState(eState: $eState, message: $message, endDate: $endDate, startDate: $startDate, pageMeta: $pageMeta, budgetList: $budgetList, budget: $budget, resultId: $resultId)';
}


}

/// @nodoc
abstract mixin class _$BudgetStateCopyWith<$Res> implements $BudgetStateCopyWith<$Res> {
  factory _$BudgetStateCopyWith(_BudgetState value, $Res Function(_BudgetState) _then) = __$BudgetStateCopyWithImpl;
@override @useResult
$Res call({
 EState eState, String? message, DateTime? endDate, DateTime? startDate, PageMeta pageMeta, List<BudgetModel> budgetList, BudgetModel? budget, int? resultId
});


@override $PageMetaCopyWith<$Res> get pageMeta;@override $BudgetModelCopyWith<$Res>? get budget;

}
/// @nodoc
class __$BudgetStateCopyWithImpl<$Res>
    implements _$BudgetStateCopyWith<$Res> {
  __$BudgetStateCopyWithImpl(this._self, this._then);

  final _BudgetState _self;
  final $Res Function(_BudgetState) _then;

/// Create a copy of BudgetState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? eState = null,Object? message = freezed,Object? endDate = freezed,Object? startDate = freezed,Object? pageMeta = null,Object? budgetList = null,Object? budget = freezed,Object? resultId = freezed,}) {
  return _then(_BudgetState(
eState: null == eState ? _self.eState : eState // ignore: cast_nullable_to_non_nullable
as EState,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,pageMeta: null == pageMeta ? _self.pageMeta : pageMeta // ignore: cast_nullable_to_non_nullable
as PageMeta,budgetList: null == budgetList ? _self._budgetList : budgetList // ignore: cast_nullable_to_non_nullable
as List<BudgetModel>,budget: freezed == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as BudgetModel?,resultId: freezed == resultId ? _self.resultId : resultId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of BudgetState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageMetaCopyWith<$Res> get pageMeta {
  
  return $PageMetaCopyWith<$Res>(_self.pageMeta, (value) {
    return _then(_self.copyWith(pageMeta: value));
  });
}/// Create a copy of BudgetState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetModelCopyWith<$Res>? get budget {
    if (_self.budget == null) {
    return null;
  }

  return $BudgetModelCopyWith<$Res>(_self.budget!, (value) {
    return _then(_self.copyWith(budget: value));
  });
}
}

// dart format on
