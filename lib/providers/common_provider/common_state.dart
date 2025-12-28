import 'package:finance_tracking/models/budget_model/budget_model.dart';
import 'package:finance_tracking/models/pie_chart/pie_chart_model.dart';
import 'package:finance_tracking/models/transaction_model/transaction_model.dart';
import 'package:finance_tracking/providers/category/category_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_state.freezed.dart';

@freezed
abstract class CommonState with _$CommonState {
  factory CommonState({
    @Default(EState.initial) EState eState,
    @Default([]) List<TransactionModel> transactions,
    @Default([]) List<TransactionModel> graphTransactions,
    @Default([]) List<TransactionModel> calenderMonthtransactions,
    PieChartModel? pieChartData,
    String? message,
    DateTime? fromLineChartDate,
    DateTime? toLineChartDate,
    DateTime? selectedCalenderMonth,
    BudgetModel? selectedBudget,
    @Default(HomeTabs.dashboard) HomeTabs currentTab,
  }) = _CommonState;

  factory CommonState.initial({required EState eState}) =>
      CommonState(eState: eState);
}

enum HomeTabs { dashboard, transaction, category, budget }
