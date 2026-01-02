import 'package:finance_tracking/models/budget_model/budget_model.dart';
import 'package:finance_tracking/models/page_meta/page_meta.dart';
import 'package:finance_tracking/providers/category/category_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'budget_state.freezed.dart';

@freezed
abstract class BudgetState with _$BudgetState {
  factory BudgetState({
    @Default(EState.initial) EState eState,
    String? message,
    DateTime? endDate,
    DateTime? startDate,
    required PageMeta pageMeta,
    @Default([]) List<BudgetModel> budgetList,
    BudgetModel? budget,
    int? resultId,
  }) = _BudgetState;

  factory BudgetState.initial({BudgetModel? budget, required EState eState}) =>
      BudgetState(budget: budget, eState: eState, pageMeta: PageMeta());
}
