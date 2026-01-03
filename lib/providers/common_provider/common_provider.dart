import 'package:finance_tracking/database/database_helper.dart';
import 'package:finance_tracking/database/database_helper_impl.dart';
import 'package:finance_tracking/models/budget_model/budget_model.dart';
import 'package:finance_tracking/models/category_model/category_model.dart';
import 'package:finance_tracking/models/pie_chart/pie_chart_model.dart';
import 'package:finance_tracking/models/transaction_model/transaction_model.dart';
import 'package:finance_tracking/providers/category/category_state.dart';
import 'package:finance_tracking/providers/common_provider/common_state.dart';
import 'package:finance_tracking/utils/extensions.dart';
import 'package:finance_tracking/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'common_provider.g.dart';

@riverpod
class CommonProvider extends _$CommonProvider {
  late DatabaseHelper databaseHelper;
  late TextEditingController fromLineChartDateController;
  late TextEditingController toLineChartDateController;
  late TextEditingController calenderMonthController;
  late TextEditingController filterSelectedBudgetController;

  @override
  CommonState build({required WidgetRef widgetRef}) {
    initWidgets();
    databaseHelper = widgetRef.watch(databaseHelperProvider);
    return CommonState.initial(eState: EState.ready);
  }

  void initWidgets() {
    calenderMonthController = TextEditingController();
    fromLineChartDateController = TextEditingController();
    toLineChartDateController = TextEditingController();
    filterSelectedBudgetController = TextEditingController();
  }

  void updateDashboardValues() {
    final currentDate = DateTime.now();
    final nextMonth = DateTime(currentDate.year, currentDate.month + 1, 1);
    final lastDate = nextMonth.subtract(Duration(days: 1));
    fromLineChartDateController.text = Utility.formatDate(
      DateTime(currentDate.year, currentDate.month, 1),
    );
    toLineChartDateController.text = Utility.formatDate(
      DateTime(currentDate.year, currentDate.month, lastDate.day),
    );
    calenderMonthController.text = Utility.calenderMonthFormatDate(currentDate);
    state = state.copyWith(
      fromLineChartDate: DateTime(currentDate.year, currentDate.month, 1),
      selectedCalenderMonth: currentDate,
      toLineChartDate: DateTime(
        currentDate.year,
        currentDate.month,
        lastDate.day,
      ),
    );
  }

  void updateSelectedBudget(BudgetModel budget) {
    filterSelectedBudgetController.text = budget.name ?? '';
    state = state.copyWith(selectedBudget: budget);
  }

  void selectfromLineTransactionDate(DateTime date) {
    fromLineChartDateController.text = Utility.formatDate(date);
    state = state.copyWith(fromLineChartDate: date);
  }

  void selecttoLineTransactionDate(DateTime date) {
    toLineChartDateController.text = Utility.formatDate(date);
    state = state.copyWith(toLineChartDate: date);
  }

  void selectCalenderMonth(DateTime date) {
    calenderMonthController.text = Utility.calenderMonthFormatDate(date);
    state = state.copyWith(selectedCalenderMonth: date);
  }

  void resetDashboardWidgets() {
    final currentDate = DateTime.now();
    final nextMonth = DateTime(currentDate.year, currentDate.month + 1, 1);
    final lastDate = nextMonth.subtract(Duration(days: 1));
    fromLineChartDateController.text = Utility.formatDate(
      DateTime(currentDate.year, currentDate.month, 1),
    );
    toLineChartDateController.text = Utility.formatDate(
      DateTime(currentDate.year, currentDate.month, lastDate.day),
    );
    calenderMonthController.text = Utility.calenderMonthFormatDate(currentDate);
    filterSelectedBudgetController.clear();
    state = state.copyWith(
      fromLineChartDate: DateTime(currentDate.year, currentDate.month, 1),
      calenderMonthtransactions: [],
      selectedCalenderMonth: currentDate,
      selectedBudget: null,
      toLineChartDate: DateTime(
        currentDate.year,
        currentDate.month,
        lastDate.day,
      ),
    );
  }

  Future<void> filterDashboard() async {
    state = state.copyWith(eState: EState.loading);
    await databaseHelper.initAppDatabase();
    await Future.wait([
          getDashboardTransactions(),
          getTransactionsForCalenderMonth(),
          if ((state.selectedBudget != null)) ...[getDataForPieChart()],
        ])
        .then((_) {
          setToInitialState();
        })
        .onError((e, trace) {
          state = state.copyWith(message: e.toString(), eState: EState.error);
          setToInitialState();
        });
  }

  Future<void> getDashboardTransactions() async {
    state = state.copyWith(eState: EState.loading);

    final result = await databaseHelper.getTransactions(
      fromDate: Utility.getDateFromDateTime(state.fromLineChartDate),
      toDate: Utility.getDateFromDateTime(state.toLineChartDate),
    );
    result.fold(
      (l) {
        throw l;
      },
      (r) {
        state = state.copyWith(graphTransactions: r);
        setToInitialState();
      },
    );
  }

  Future<void> getTransactionsForCalenderMonth() async {
    final result = await databaseHelper.getTransactions(
      fromDate: Utility.getDateFromDateTime(
        state.selectedCalenderMonth?.firstDayOfMonth,
      ),
      toDate: Utility.getDateFromDateTime(
        state.selectedCalenderMonth?.lastDayOfMonth,
      ),
    );
    result.fold(
      (l) {
        throw l;
      },
      (r) {
        state = state.copyWith(calenderMonthtransactions: r);
      },
    );
  }

  Future<void> getDataForPieChart() async {
    try {
      final transactions = await getTransactionsForPieChart();

      if (transactions == null || transactions.isEmpty) {
        throw Exception("No transactions found in this budget.");
      }

      final categoryIds = transactions
          .map((e) => e.categoryId)
          .whereType<int>()
          .toSet()
          .toList();

      if (categoryIds.isEmpty) return;

      final categories = await getCategoriesForPieChart(categoryIds);

      if (categories == null || categories.isEmpty) {
        throw Exception('Something went wrong! Please try again later!');
      }

      final Map<int, List<TransactionModel>> transactionsByCategory = {};
      final Map<int, num> expenseByCategory = {};

      for (final tx in transactions) {
        final categoryId = tx.categoryId;
        if (categoryId == null) continue;

        transactionsByCategory.putIfAbsent(categoryId, () => []).add(tx);

        if (tx.type == 0) {
          expenseByCategory[categoryId] =
              (expenseByCategory[categoryId] ?? 0) + (tx.amount ?? 0);
        }
      }

      final pieChartData = PieChartModel(
        totalBudget: state.selectedBudget?.budgetAmount,
        budgetName: state.selectedBudget?.name,
        items: categories.map((category) {
          return PieChartItemModel(
            categoryName: category.name,
            transactions: transactionsByCategory[category.id] ?? [],
            totalExpense: expenseByCategory[category.id] ?? 0,
          );
        }).toList(),
      );

      state = state.copyWith(pieChartData: pieChartData);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TransactionModel>?> getTransactionsForPieChart() async {
    final result = await databaseHelper.getTransactions(
      budgetId: state.selectedBudget?.id,
    );
    return result.fold(
      (l) {
        throw l;
      },
      (r) {
        return r;
      },
    );
  }

  Future<List<CategoryModel>?> getCategoriesForPieChart(List<int?>? ids) async {
    final result = await databaseHelper.getCategories(ids: ids);
    return result.fold(
      (l) {
        throw l;
      },
      (r) {
        return r;
      },
    );
  }

  void setToInitialState() {
    state = state.copyWith(eState: EState.initial, message: null);
  }

  void updateBottomNavigationBarIndex(HomeTabs currentTab) {
    state = state.copyWith(currentTab: currentTab);
  }
}
