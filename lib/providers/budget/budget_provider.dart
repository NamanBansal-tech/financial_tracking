import 'package:finance_tracking/database/database_helper.dart';
import 'package:finance_tracking/database/database_helper_impl.dart';
import 'package:finance_tracking/models/budget_model/budget_model.dart';
import 'package:finance_tracking/providers/budget/budget_state.dart';
import 'package:finance_tracking/providers/category/category_state.dart';
import 'package:finance_tracking/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'budget_provider.g.dart';

@riverpod
class BudgetProvider extends _$BudgetProvider {
  late GlobalKey<FormState> formKey;
  late DatabaseHelper databaseHelper;
  late TextEditingController nameController;
  late TextEditingController amountController;
  late TextEditingController startDateController;
  late TextEditingController endDateController;

  @override
  BudgetState build({required WidgetRef widgetRef, BudgetModel? budget}) {
    databaseHelper = widgetRef.watch(databaseHelperProvider);
    initWidgets();
    return BudgetState.initial(budget: budget, eState: EState.ready);
  }

  void initWidgets() {
    nameController = TextEditingController();
    amountController = TextEditingController();
    formKey = GlobalKey<FormState>();
    startDateController = TextEditingController();
    endDateController = TextEditingController();
  }

  void resetWidgets() {
    nameController.clear();
    amountController.clear();
    state = state.copyWith(budget: null, startDate: null, endDate: null);
  }

  void updateValuesForEditBudget() {
    nameController.text = state.budget?.name ?? "";
    amountController.text = (state.budget?.budgetAmount ?? 0).toString();
    if (state.budget?.startDate?.isNotEmpty ?? false) {
      updateBudgetStartDate(DateTime.tryParse(state.budget?.startDate ?? ""));
    }
    if (state.budget?.endDate?.isNotEmpty ?? false) {
      updateBudgetEndDate(DateTime.tryParse(state.budget?.endDate ?? ""));
    }
    setToInitialState();
  }

  void setToInitialState() {
    state = state.copyWith(eState: EState.initial, message: null);
  }

  void updateBudgetStartDate(DateTime? startDate) {
    startDateController.text = Utility.getFormattedBudgetDate(startDate);
    endDateController.text = "";
    state = state.copyWith(startDate: startDate, endDate: null);
  }

  void updateBudgetEndDate(DateTime? endDate) {
    endDateController.text = Utility.getFormattedBudgetDate(endDate);
    state = state.copyWith(endDate: endDate);
  }

  bool validateForm() {
    bool isVaidate = formKey.currentState!.validate();
    isVaidate = (!((state.startDate == null) || (state.endDate == null)));
    return isVaidate;
  }

  Future<void> getBudgetList() async {
    state = state.copyWith(eState: EState.loading);
    final String categoryName = nameController.text.trim();
    final String budgetAmount = amountController.text.trim();
    final result = await databaseHelper.getBudgetList(
      name: categoryName.isNotEmpty ? categoryName : null,
      budgetAmount: budgetAmount.isNotEmpty
          ? double.tryParse(budgetAmount)
          : null,
      startDate: Utility.getDateFromDateTime(state.startDate),
      endDate: Utility.getDateFromDateTime(state.endDate),
    );
    result.fold(
      (l) {
        state = state.copyWith(
          eState: EState.error,
          message: l,
          budgetList: [],
        );
        setToInitialState();
      },
      (r) {
        state = state.copyWith(budgetList: r);
        setToInitialState();
      },
    );
  }

  Future<void> getBudget(int budgetId) async {
    state = state.copyWith(eState: EState.loading);
    final result = await databaseHelper.getBudget(budgetId);
    result.fold(
      (l) {
        state = state.copyWith(eState: EState.error, message: l);
        setToInitialState();
      },
      (r) {
        updateSelectedBudget(r);
        setToInitialState();
      },
    );
  }

  void updateSelectedBudget(BudgetModel? budget) {
    nameController.text = budget?.name ?? "";
    state = state.copyWith(budget: budget);
  }

  Future<void> createBudget() async {
    if (formKey.currentState!.validate()) {
      state = state.copyWith(eState: EState.loading);
      final budget = BudgetModel(
        name: nameController.text.trim(),
        startDate: Utility.getDateFromDateTime(state.startDate),
        endDate: Utility.getDateFromDateTime(state.endDate),

        budgetAmount: amountController.text.trim().isNotEmpty
            ? double.parse(amountController.text.trim())
            : null,
      );
      final result = await databaseHelper.addBudget(budget);
      result.fold(
        (l) {
          state = state.copyWith(message: l, eState: EState.error);
          setToInitialState();
        },
        (r) {
          state = state.copyWith(
            message: 'Budget Added Successfully',
            resultId: r,
            eState: EState.success,
          );
          setToInitialState();
        },
      );
    } else {
      state = state.copyWith(
        message: 'Please fill all the mandatory fields',
        eState: EState.error,
      );
      setToInitialState();
    }
  }

  Future<void> editBudget() async {
    if (validateForm()) {
      state = state.copyWith(eState: EState.loading);
      final budget = BudgetModel(
        id: state.budget?.id,
        name: nameController.text.trim(),
        totalExpense: state.budget?.totalExpense,
        startDate: state.startDate?.toString(),
        endDate: state.endDate?.toString(),
        budgetAmount: amountController.text.trim().isNotEmpty
            ? double.parse(amountController.text.trim())
            : null,
      );
      final result = await databaseHelper.editBudget(budget);
      result.fold(
        (l) {
          state = state.copyWith(message: l, eState: EState.error);
          setToInitialState();
        },
        (r) {
          state = state.copyWith(message: r, eState: EState.success);
          setToInitialState();
        },
      );
    } else {
      state = state.copyWith(
        message: 'Please fill all the mandatory fields',
        eState: EState.error,
      );
      setToInitialState();
    }
  }

  Future<void> deleteBudget(int budgetId) async {
    state = state.copyWith(eState: EState.loading);
    final result = await databaseHelper.deleteBudget(budgetId);
    result.fold(
      (l) {
        state = state.copyWith(message: l, eState: EState.error);
        setToInitialState();
      },
      (r) {
        state = state.copyWith(message: r, eState: EState.successDelete);
      },
    );
  }

  Future<void> updateBudgetFromCreateTransaction(BudgetModel budget) async {
    state = state.copyWith(eState: EState.updatingBudgetForTransaction);
    final result = await databaseHelper.editBudget(budget);
    result.fold(
      (l) {
        state = state.copyWith(message: l, eState: EState.error);
        setToInitialState();
      },
      (r) {
        state = state.copyWith(message: r, eState: EState.success);
        setToInitialState();
      },
    );
  }
}
