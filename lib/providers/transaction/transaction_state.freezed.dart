// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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

 ETransactionState get eTransactionState; List<TransactionModel> get transactions; List<TransactionModel> get graphTransactions; List<TransactionModel> get calenderMonthtransactions; bool get isIncomeAddInBudget; PageMeta get pageMeta; String? get message; DateTime? get fromLineChartDate; DateTime? get toLineChartDate; DateTime? get selectedCalenderMonth; TransactionType? get selectedTransactionType; int? get selectedCategoryId; DateTime? get selectedDate;
/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionStateCopyWith<TransactionState> get copyWith => _$TransactionStateCopyWithImpl<TransactionState>(this as TransactionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionState&&(identical(other.eTransactionState, eTransactionState) || other.eTransactionState == eTransactionState)&&const DeepCollectionEquality().equals(other.transactions, transactions)&&const DeepCollectionEquality().equals(other.graphTransactions, graphTransactions)&&const DeepCollectionEquality().equals(other.calenderMonthtransactions, calenderMonthtransactions)&&(identical(other.isIncomeAddInBudget, isIncomeAddInBudget) || other.isIncomeAddInBudget == isIncomeAddInBudget)&&(identical(other.pageMeta, pageMeta) || other.pageMeta == pageMeta)&&(identical(other.message, message) || other.message == message)&&(identical(other.fromLineChartDate, fromLineChartDate) || other.fromLineChartDate == fromLineChartDate)&&(identical(other.toLineChartDate, toLineChartDate) || other.toLineChartDate == toLineChartDate)&&(identical(other.selectedCalenderMonth, selectedCalenderMonth) || other.selectedCalenderMonth == selectedCalenderMonth)&&(identical(other.selectedTransactionType, selectedTransactionType) || other.selectedTransactionType == selectedTransactionType)&&(identical(other.selectedCategoryId, selectedCategoryId) || other.selectedCategoryId == selectedCategoryId)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate));
}


@override
int get hashCode => Object.hash(runtimeType,eTransactionState,const DeepCollectionEquality().hash(transactions),const DeepCollectionEquality().hash(graphTransactions),const DeepCollectionEquality().hash(calenderMonthtransactions),isIncomeAddInBudget,pageMeta,message,fromLineChartDate,toLineChartDate,selectedCalenderMonth,selectedTransactionType,selectedCategoryId,selectedDate);

@override
String toString() {
  return 'TransactionState(eTransactionState: $eTransactionState, transactions: $transactions, graphTransactions: $graphTransactions, calenderMonthtransactions: $calenderMonthtransactions, isIncomeAddInBudget: $isIncomeAddInBudget, pageMeta: $pageMeta, message: $message, fromLineChartDate: $fromLineChartDate, toLineChartDate: $toLineChartDate, selectedCalenderMonth: $selectedCalenderMonth, selectedTransactionType: $selectedTransactionType, selectedCategoryId: $selectedCategoryId, selectedDate: $selectedDate)';
}


}

/// @nodoc
abstract mixin class $TransactionStateCopyWith<$Res>  {
  factory $TransactionStateCopyWith(TransactionState value, $Res Function(TransactionState) _then) = _$TransactionStateCopyWithImpl;
@useResult
$Res call({
 ETransactionState eTransactionState, List<TransactionModel> transactions, List<TransactionModel> graphTransactions, List<TransactionModel> calenderMonthtransactions, bool isIncomeAddInBudget, PageMeta pageMeta, String? message, DateTime? fromLineChartDate, DateTime? toLineChartDate, DateTime? selectedCalenderMonth, TransactionType? selectedTransactionType, int? selectedCategoryId, DateTime? selectedDate
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
@pragma('vm:prefer-inline') @override $Res call({Object? eTransactionState = null,Object? transactions = null,Object? graphTransactions = null,Object? calenderMonthtransactions = null,Object? isIncomeAddInBudget = null,Object? pageMeta = null,Object? message = freezed,Object? fromLineChartDate = freezed,Object? toLineChartDate = freezed,Object? selectedCalenderMonth = freezed,Object? selectedTransactionType = freezed,Object? selectedCategoryId = freezed,Object? selectedDate = freezed,}) {
  return _then(_self.copyWith(
eTransactionState: null == eTransactionState ? _self.eTransactionState : eTransactionState // ignore: cast_nullable_to_non_nullable
as ETransactionState,transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionModel>,graphTransactions: null == graphTransactions ? _self.graphTransactions : graphTransactions // ignore: cast_nullable_to_non_nullable
as List<TransactionModel>,calenderMonthtransactions: null == calenderMonthtransactions ? _self.calenderMonthtransactions : calenderMonthtransactions // ignore: cast_nullable_to_non_nullable
as List<TransactionModel>,isIncomeAddInBudget: null == isIncomeAddInBudget ? _self.isIncomeAddInBudget : isIncomeAddInBudget // ignore: cast_nullable_to_non_nullable
as bool,pageMeta: null == pageMeta ? _self.pageMeta : pageMeta // ignore: cast_nullable_to_non_nullable
as PageMeta,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,fromLineChartDate: freezed == fromLineChartDate ? _self.fromLineChartDate : fromLineChartDate // ignore: cast_nullable_to_non_nullable
as DateTime?,toLineChartDate: freezed == toLineChartDate ? _self.toLineChartDate : toLineChartDate // ignore: cast_nullable_to_non_nullable
as DateTime?,selectedCalenderMonth: freezed == selectedCalenderMonth ? _self.selectedCalenderMonth : selectedCalenderMonth // ignore: cast_nullable_to_non_nullable
as DateTime?,selectedTransactionType: freezed == selectedTransactionType ? _self.selectedTransactionType : selectedTransactionType // ignore: cast_nullable_to_non_nullable
as TransactionType?,selectedCategoryId: freezed == selectedCategoryId ? _self.selectedCategoryId : selectedCategoryId // ignore: cast_nullable_to_non_nullable
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


/// @nodoc


class _TransactionState implements TransactionState {
   _TransactionState({this.eTransactionState = ETransactionState.initial, final  List<TransactionModel> transactions = const [], final  List<TransactionModel> graphTransactions = const [], final  List<TransactionModel> calenderMonthtransactions = const [], this.isIncomeAddInBudget = false, required this.pageMeta, this.message, this.fromLineChartDate, this.toLineChartDate, this.selectedCalenderMonth, this.selectedTransactionType, this.selectedCategoryId, this.selectedDate}): _transactions = transactions,_graphTransactions = graphTransactions,_calenderMonthtransactions = calenderMonthtransactions;
  

@override@JsonKey() final  ETransactionState eTransactionState;
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

@override@JsonKey() final  bool isIncomeAddInBudget;
@override final  PageMeta pageMeta;
@override final  String? message;
@override final  DateTime? fromLineChartDate;
@override final  DateTime? toLineChartDate;
@override final  DateTime? selectedCalenderMonth;
@override final  TransactionType? selectedTransactionType;
@override final  int? selectedCategoryId;
@override final  DateTime? selectedDate;

/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionStateCopyWith<_TransactionState> get copyWith => __$TransactionStateCopyWithImpl<_TransactionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionState&&(identical(other.eTransactionState, eTransactionState) || other.eTransactionState == eTransactionState)&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&const DeepCollectionEquality().equals(other._graphTransactions, _graphTransactions)&&const DeepCollectionEquality().equals(other._calenderMonthtransactions, _calenderMonthtransactions)&&(identical(other.isIncomeAddInBudget, isIncomeAddInBudget) || other.isIncomeAddInBudget == isIncomeAddInBudget)&&(identical(other.pageMeta, pageMeta) || other.pageMeta == pageMeta)&&(identical(other.message, message) || other.message == message)&&(identical(other.fromLineChartDate, fromLineChartDate) || other.fromLineChartDate == fromLineChartDate)&&(identical(other.toLineChartDate, toLineChartDate) || other.toLineChartDate == toLineChartDate)&&(identical(other.selectedCalenderMonth, selectedCalenderMonth) || other.selectedCalenderMonth == selectedCalenderMonth)&&(identical(other.selectedTransactionType, selectedTransactionType) || other.selectedTransactionType == selectedTransactionType)&&(identical(other.selectedCategoryId, selectedCategoryId) || other.selectedCategoryId == selectedCategoryId)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate));
}


@override
int get hashCode => Object.hash(runtimeType,eTransactionState,const DeepCollectionEquality().hash(_transactions),const DeepCollectionEquality().hash(_graphTransactions),const DeepCollectionEquality().hash(_calenderMonthtransactions),isIncomeAddInBudget,pageMeta,message,fromLineChartDate,toLineChartDate,selectedCalenderMonth,selectedTransactionType,selectedCategoryId,selectedDate);

@override
String toString() {
  return 'TransactionState(eTransactionState: $eTransactionState, transactions: $transactions, graphTransactions: $graphTransactions, calenderMonthtransactions: $calenderMonthtransactions, isIncomeAddInBudget: $isIncomeAddInBudget, pageMeta: $pageMeta, message: $message, fromLineChartDate: $fromLineChartDate, toLineChartDate: $toLineChartDate, selectedCalenderMonth: $selectedCalenderMonth, selectedTransactionType: $selectedTransactionType, selectedCategoryId: $selectedCategoryId, selectedDate: $selectedDate)';
}


}

/// @nodoc
abstract mixin class _$TransactionStateCopyWith<$Res> implements $TransactionStateCopyWith<$Res> {
  factory _$TransactionStateCopyWith(_TransactionState value, $Res Function(_TransactionState) _then) = __$TransactionStateCopyWithImpl;
@override @useResult
$Res call({
 ETransactionState eTransactionState, List<TransactionModel> transactions, List<TransactionModel> graphTransactions, List<TransactionModel> calenderMonthtransactions, bool isIncomeAddInBudget, PageMeta pageMeta, String? message, DateTime? fromLineChartDate, DateTime? toLineChartDate, DateTime? selectedCalenderMonth, TransactionType? selectedTransactionType, int? selectedCategoryId, DateTime? selectedDate
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
@override @pragma('vm:prefer-inline') $Res call({Object? eTransactionState = null,Object? transactions = null,Object? graphTransactions = null,Object? calenderMonthtransactions = null,Object? isIncomeAddInBudget = null,Object? pageMeta = null,Object? message = freezed,Object? fromLineChartDate = freezed,Object? toLineChartDate = freezed,Object? selectedCalenderMonth = freezed,Object? selectedTransactionType = freezed,Object? selectedCategoryId = freezed,Object? selectedDate = freezed,}) {
  return _then(_TransactionState(
eTransactionState: null == eTransactionState ? _self.eTransactionState : eTransactionState // ignore: cast_nullable_to_non_nullable
as ETransactionState,transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<TransactionModel>,graphTransactions: null == graphTransactions ? _self._graphTransactions : graphTransactions // ignore: cast_nullable_to_non_nullable
as List<TransactionModel>,calenderMonthtransactions: null == calenderMonthtransactions ? _self._calenderMonthtransactions : calenderMonthtransactions // ignore: cast_nullable_to_non_nullable
as List<TransactionModel>,isIncomeAddInBudget: null == isIncomeAddInBudget ? _self.isIncomeAddInBudget : isIncomeAddInBudget // ignore: cast_nullable_to_non_nullable
as bool,pageMeta: null == pageMeta ? _self.pageMeta : pageMeta // ignore: cast_nullable_to_non_nullable
as PageMeta,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,fromLineChartDate: freezed == fromLineChartDate ? _self.fromLineChartDate : fromLineChartDate // ignore: cast_nullable_to_non_nullable
as DateTime?,toLineChartDate: freezed == toLineChartDate ? _self.toLineChartDate : toLineChartDate // ignore: cast_nullable_to_non_nullable
as DateTime?,selectedCalenderMonth: freezed == selectedCalenderMonth ? _self.selectedCalenderMonth : selectedCalenderMonth // ignore: cast_nullable_to_non_nullable
as DateTime?,selectedTransactionType: freezed == selectedTransactionType ? _self.selectedTransactionType : selectedTransactionType // ignore: cast_nullable_to_non_nullable
as TransactionType?,selectedCategoryId: freezed == selectedCategoryId ? _self.selectedCategoryId : selectedCategoryId // ignore: cast_nullable_to_non_nullable
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
