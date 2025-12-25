import 'package:finance_tracking/models/page_meta/page_meta.dart';
import 'package:finance_tracking/models/transaction_model/transaction_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_state.freezed.dart';

@freezed
abstract class TransactionState with _$TransactionState {
  factory TransactionState({
    @Default(ETransactionState.initial) ETransactionState eTransactionState,
    @Default([]) List<TransactionModel> transactions,
    @Default([]) List<TransactionModel> graphTransactions,
    @Default([]) List<TransactionModel> calenderMonthtransactions,
    @Default(false) bool isIncomeAddInBudget,
    required PageMeta pageMeta,
    String? message,
     DateTime? fromLineChartDate,
     DateTime? toLineChartDate,
     DateTime? selectedCalenderMonth,
    TransactionType? selectedTransactionType,
    int? selectedCategoryId,
    DateTime? selectedDate,
  }) = _TransactionState;

  factory TransactionState.initial({
    required ETransactionState eTransactionState,
  }) =>
      TransactionState(
        eTransactionState: eTransactionState,
        pageMeta: PageMeta(),
      );
}

enum ETransactionState {
  initial,
  loadingDashboard,
  loading,
  loadingMore,
  ready,
  error,
  success,
  successDelete,
}

enum ESearchType{
filter,
reset,
}