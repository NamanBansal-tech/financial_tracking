import 'package:finance_tracking/models/page_meta/page_meta.dart';
import 'package:finance_tracking/models/transaction_model/transaction_model.dart';
import 'package:finance_tracking/providers/category/category_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_state.freezed.dart';

@freezed
abstract class TransactionState with _$TransactionState {
  factory TransactionState({
    @Default(EState.initial) EState eState,
    @Default([]) List<TransactionModel> transactions,
    @Default(false) bool isIncomeAddInBudget,
    required PageMeta pageMeta,
    String? message,
    TransactionType? selectedTransactionType,
    int? selectedCategoryId,
    int? selectedBudgetId,
    DateTime? selectedDate,
    @Default(0) num totalExpense,
    @Default(0) num totalIncome,
  }) = _TransactionState;

  factory TransactionState.initial({required EState eState}) =>
      TransactionState(eState: eState, pageMeta: PageMeta());
}

enum ESearchType { filter, reset }
