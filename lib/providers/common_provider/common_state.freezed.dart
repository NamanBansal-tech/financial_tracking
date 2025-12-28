// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommonState {

 EState get eState; List<TransactionModel> get transactions; List<TransactionModel> get graphTransactions; List<TransactionModel> get calenderMonthtransactions; PieChartModel? get pieChartData; String? get message; DateTime? get fromLineChartDate; DateTime? get toLineChartDate; DateTime? get selectedCalenderMonth; BudgetModel? get selectedBudget; HomeTabs get currentTab;
/// Create a copy of CommonState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommonStateCopyWith<CommonState> get copyWith => _$CommonStateCopyWithImpl<CommonState>(this as CommonState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommonState&&(identical(other.eState, eState) || other.eState == eState)&&const DeepCollectionEquality().equals(other.transactions, transactions)&&const DeepCollectionEquality().equals(other.graphTransactions, graphTransactions)&&const DeepCollectionEquality().equals(other.calenderMonthtransactions, calenderMonthtransactions)&&(identical(other.pieChartData, pieChartData) || other.pieChartData == pieChartData)&&(identical(other.message, message) || other.message == message)&&(identical(other.fromLineChartDate, fromLineChartDate) || other.fromLineChartDate == fromLineChartDate)&&(identical(other.toLineChartDate, toLineChartDate) || other.toLineChartDate == toLineChartDate)&&(identical(other.selectedCalenderMonth, selectedCalenderMonth) || other.selectedCalenderMonth == selectedCalenderMonth)&&(identical(other.selectedBudget, selectedBudget) || other.selectedBudget == selectedBudget)&&(identical(other.currentTab, currentTab) || other.currentTab == currentTab));
}


@override
int get hashCode => Object.hash(runtimeType,eState,const DeepCollectionEquality().hash(transactions),const DeepCollectionEquality().hash(graphTransactions),const DeepCollectionEquality().hash(calenderMonthtransactions),pieChartData,message,fromLineChartDate,toLineChartDate,selectedCalenderMonth,selectedBudget,currentTab);

@override
String toString() {
  return 'CommonState(eState: $eState, transactions: $transactions, graphTransactions: $graphTransactions, calenderMonthtransactions: $calenderMonthtransactions, pieChartData: $pieChartData, message: $message, fromLineChartDate: $fromLineChartDate, toLineChartDate: $toLineChartDate, selectedCalenderMonth: $selectedCalenderMonth, selectedBudget: $selectedBudget, currentTab: $currentTab)';
}


}

/// @nodoc
abstract mixin class $CommonStateCopyWith<$Res>  {
  factory $CommonStateCopyWith(CommonState value, $Res Function(CommonState) _then) = _$CommonStateCopyWithImpl;
@useResult
$Res call({
 EState eState, List<TransactionModel> transactions, List<TransactionModel> graphTransactions, List<TransactionModel> calenderMonthtransactions, PieChartModel? pieChartData, String? message, DateTime? fromLineChartDate, DateTime? toLineChartDate, DateTime? selectedCalenderMonth, BudgetModel? selectedBudget, HomeTabs currentTab
});


$PieChartModelCopyWith<$Res>? get pieChartData;$BudgetModelCopyWith<$Res>? get selectedBudget;

}
/// @nodoc
class _$CommonStateCopyWithImpl<$Res>
    implements $CommonStateCopyWith<$Res> {
  _$CommonStateCopyWithImpl(this._self, this._then);

  final CommonState _self;
  final $Res Function(CommonState) _then;

/// Create a copy of CommonState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? eState = null,Object? transactions = null,Object? graphTransactions = null,Object? calenderMonthtransactions = null,Object? pieChartData = freezed,Object? message = freezed,Object? fromLineChartDate = freezed,Object? toLineChartDate = freezed,Object? selectedCalenderMonth = freezed,Object? selectedBudget = freezed,Object? currentTab = null,}) {
  return _then(_self.copyWith(
eState: null == eState ? _self.eState : eState // ignore: cast_nullable_to_non_nullable
as EState,transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionModel>,graphTransactions: null == graphTransactions ? _self.graphTransactions : graphTransactions // ignore: cast_nullable_to_non_nullable
as List<TransactionModel>,calenderMonthtransactions: null == calenderMonthtransactions ? _self.calenderMonthtransactions : calenderMonthtransactions // ignore: cast_nullable_to_non_nullable
as List<TransactionModel>,pieChartData: freezed == pieChartData ? _self.pieChartData : pieChartData // ignore: cast_nullable_to_non_nullable
as PieChartModel?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,fromLineChartDate: freezed == fromLineChartDate ? _self.fromLineChartDate : fromLineChartDate // ignore: cast_nullable_to_non_nullable
as DateTime?,toLineChartDate: freezed == toLineChartDate ? _self.toLineChartDate : toLineChartDate // ignore: cast_nullable_to_non_nullable
as DateTime?,selectedCalenderMonth: freezed == selectedCalenderMonth ? _self.selectedCalenderMonth : selectedCalenderMonth // ignore: cast_nullable_to_non_nullable
as DateTime?,selectedBudget: freezed == selectedBudget ? _self.selectedBudget : selectedBudget // ignore: cast_nullable_to_non_nullable
as BudgetModel?,currentTab: null == currentTab ? _self.currentTab : currentTab // ignore: cast_nullable_to_non_nullable
as HomeTabs,
  ));
}
/// Create a copy of CommonState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PieChartModelCopyWith<$Res>? get pieChartData {
    if (_self.pieChartData == null) {
    return null;
  }

  return $PieChartModelCopyWith<$Res>(_self.pieChartData!, (value) {
    return _then(_self.copyWith(pieChartData: value));
  });
}/// Create a copy of CommonState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetModelCopyWith<$Res>? get selectedBudget {
    if (_self.selectedBudget == null) {
    return null;
  }

  return $BudgetModelCopyWith<$Res>(_self.selectedBudget!, (value) {
    return _then(_self.copyWith(selectedBudget: value));
  });
}
}


/// Adds pattern-matching-related methods to [CommonState].
extension CommonStatePatterns on CommonState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommonState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommonState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommonState value)  $default,){
final _that = this;
switch (_that) {
case _CommonState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommonState value)?  $default,){
final _that = this;
switch (_that) {
case _CommonState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EState eState,  List<TransactionModel> transactions,  List<TransactionModel> graphTransactions,  List<TransactionModel> calenderMonthtransactions,  PieChartModel? pieChartData,  String? message,  DateTime? fromLineChartDate,  DateTime? toLineChartDate,  DateTime? selectedCalenderMonth,  BudgetModel? selectedBudget,  HomeTabs currentTab)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommonState() when $default != null:
return $default(_that.eState,_that.transactions,_that.graphTransactions,_that.calenderMonthtransactions,_that.pieChartData,_that.message,_that.fromLineChartDate,_that.toLineChartDate,_that.selectedCalenderMonth,_that.selectedBudget,_that.currentTab);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EState eState,  List<TransactionModel> transactions,  List<TransactionModel> graphTransactions,  List<TransactionModel> calenderMonthtransactions,  PieChartModel? pieChartData,  String? message,  DateTime? fromLineChartDate,  DateTime? toLineChartDate,  DateTime? selectedCalenderMonth,  BudgetModel? selectedBudget,  HomeTabs currentTab)  $default,) {final _that = this;
switch (_that) {
case _CommonState():
return $default(_that.eState,_that.transactions,_that.graphTransactions,_that.calenderMonthtransactions,_that.pieChartData,_that.message,_that.fromLineChartDate,_that.toLineChartDate,_that.selectedCalenderMonth,_that.selectedBudget,_that.currentTab);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EState eState,  List<TransactionModel> transactions,  List<TransactionModel> graphTransactions,  List<TransactionModel> calenderMonthtransactions,  PieChartModel? pieChartData,  String? message,  DateTime? fromLineChartDate,  DateTime? toLineChartDate,  DateTime? selectedCalenderMonth,  BudgetModel? selectedBudget,  HomeTabs currentTab)?  $default,) {final _that = this;
switch (_that) {
case _CommonState() when $default != null:
return $default(_that.eState,_that.transactions,_that.graphTransactions,_that.calenderMonthtransactions,_that.pieChartData,_that.message,_that.fromLineChartDate,_that.toLineChartDate,_that.selectedCalenderMonth,_that.selectedBudget,_that.currentTab);case _:
  return null;

}
}

}

/// @nodoc


class _CommonState implements CommonState {
   _CommonState({this.eState = EState.initial, final  List<TransactionModel> transactions = const [], final  List<TransactionModel> graphTransactions = const [], final  List<TransactionModel> calenderMonthtransactions = const [], this.pieChartData, this.message, this.fromLineChartDate, this.toLineChartDate, this.selectedCalenderMonth, this.selectedBudget, this.currentTab = HomeTabs.dashboard}): _transactions = transactions,_graphTransactions = graphTransactions,_calenderMonthtransactions = calenderMonthtransactions;
  

@override@JsonKey() final  EState eState;
 final  List<TransactionModel> _transactions;
@override@JsonKey() List<TransactionModel> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}

 final  List<TransactionModel> _graphTransactions;
@override@JsonKey() List<TransactionModel> get graphTransactions {
  if (_graphTransactions is EqualUnmodifiableListView) return _graphTransactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_graphTransactions);
}

 final  List<TransactionModel> _calenderMonthtransactions;
@override@JsonKey() List<TransactionModel> get calenderMonthtransactions {
  if (_calenderMonthtransactions is EqualUnmodifiableListView) return _calenderMonthtransactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_calenderMonthtransactions);
}

@override final  PieChartModel? pieChartData;
@override final  String? message;
@override final  DateTime? fromLineChartDate;
@override final  DateTime? toLineChartDate;
@override final  DateTime? selectedCalenderMonth;
@override final  BudgetModel? selectedBudget;
@override@JsonKey() final  HomeTabs currentTab;

/// Create a copy of CommonState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommonStateCopyWith<_CommonState> get copyWith => __$CommonStateCopyWithImpl<_CommonState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommonState&&(identical(other.eState, eState) || other.eState == eState)&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&const DeepCollectionEquality().equals(other._graphTransactions, _graphTransactions)&&const DeepCollectionEquality().equals(other._calenderMonthtransactions, _calenderMonthtransactions)&&(identical(other.pieChartData, pieChartData) || other.pieChartData == pieChartData)&&(identical(other.message, message) || other.message == message)&&(identical(other.fromLineChartDate, fromLineChartDate) || other.fromLineChartDate == fromLineChartDate)&&(identical(other.toLineChartDate, toLineChartDate) || other.toLineChartDate == toLineChartDate)&&(identical(other.selectedCalenderMonth, selectedCalenderMonth) || other.selectedCalenderMonth == selectedCalenderMonth)&&(identical(other.selectedBudget, selectedBudget) || other.selectedBudget == selectedBudget)&&(identical(other.currentTab, currentTab) || other.currentTab == currentTab));
}


@override
int get hashCode => Object.hash(runtimeType,eState,const DeepCollectionEquality().hash(_transactions),const DeepCollectionEquality().hash(_graphTransactions),const DeepCollectionEquality().hash(_calenderMonthtransactions),pieChartData,message,fromLineChartDate,toLineChartDate,selectedCalenderMonth,selectedBudget,currentTab);

@override
String toString() {
  return 'CommonState(eState: $eState, transactions: $transactions, graphTransactions: $graphTransactions, calenderMonthtransactions: $calenderMonthtransactions, pieChartData: $pieChartData, message: $message, fromLineChartDate: $fromLineChartDate, toLineChartDate: $toLineChartDate, selectedCalenderMonth: $selectedCalenderMonth, selectedBudget: $selectedBudget, currentTab: $currentTab)';
}


}

/// @nodoc
abstract mixin class _$CommonStateCopyWith<$Res> implements $CommonStateCopyWith<$Res> {
  factory _$CommonStateCopyWith(_CommonState value, $Res Function(_CommonState) _then) = __$CommonStateCopyWithImpl;
@override @useResult
$Res call({
 EState eState, List<TransactionModel> transactions, List<TransactionModel> graphTransactions, List<TransactionModel> calenderMonthtransactions, PieChartModel? pieChartData, String? message, DateTime? fromLineChartDate, DateTime? toLineChartDate, DateTime? selectedCalenderMonth, BudgetModel? selectedBudget, HomeTabs currentTab
});


@override $PieChartModelCopyWith<$Res>? get pieChartData;@override $BudgetModelCopyWith<$Res>? get selectedBudget;

}
/// @nodoc
class __$CommonStateCopyWithImpl<$Res>
    implements _$CommonStateCopyWith<$Res> {
  __$CommonStateCopyWithImpl(this._self, this._then);

  final _CommonState _self;
  final $Res Function(_CommonState) _then;

/// Create a copy of CommonState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? eState = null,Object? transactions = null,Object? graphTransactions = null,Object? calenderMonthtransactions = null,Object? pieChartData = freezed,Object? message = freezed,Object? fromLineChartDate = freezed,Object? toLineChartDate = freezed,Object? selectedCalenderMonth = freezed,Object? selectedBudget = freezed,Object? currentTab = null,}) {
  return _then(_CommonState(
eState: null == eState ? _self.eState : eState // ignore: cast_nullable_to_non_nullable
as EState,transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionModel>,graphTransactions: null == graphTransactions ? _self._graphTransactions : graphTransactions // ignore: cast_nullable_to_non_nullable
as List<TransactionModel>,calenderMonthtransactions: null == calenderMonthtransactions ? _self._calenderMonthtransactions : calenderMonthtransactions // ignore: cast_nullable_to_non_nullable
as List<TransactionModel>,pieChartData: freezed == pieChartData ? _self.pieChartData : pieChartData // ignore: cast_nullable_to_non_nullable
as PieChartModel?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,fromLineChartDate: freezed == fromLineChartDate ? _self.fromLineChartDate : fromLineChartDate // ignore: cast_nullable_to_non_nullable
as DateTime?,toLineChartDate: freezed == toLineChartDate ? _self.toLineChartDate : toLineChartDate // ignore: cast_nullable_to_non_nullable
as DateTime?,selectedCalenderMonth: freezed == selectedCalenderMonth ? _self.selectedCalenderMonth : selectedCalenderMonth // ignore: cast_nullable_to_non_nullable
as DateTime?,selectedBudget: freezed == selectedBudget ? _self.selectedBudget : selectedBudget // ignore: cast_nullable_to_non_nullable
as BudgetModel?,currentTab: null == currentTab ? _self.currentTab : currentTab // ignore: cast_nullable_to_non_nullable
as HomeTabs,
  ));
}

/// Create a copy of CommonState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PieChartModelCopyWith<$Res>? get pieChartData {
    if (_self.pieChartData == null) {
    return null;
  }

  return $PieChartModelCopyWith<$Res>(_self.pieChartData!, (value) {
    return _then(_self.copyWith(pieChartData: value));
  });
}/// Create a copy of CommonState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetModelCopyWith<$Res>? get selectedBudget {
    if (_self.selectedBudget == null) {
    return null;
  }

  return $BudgetModelCopyWith<$Res>(_self.selectedBudget!, (value) {
    return _then(_self.copyWith(selectedBudget: value));
  });
}
}

// dart format on
