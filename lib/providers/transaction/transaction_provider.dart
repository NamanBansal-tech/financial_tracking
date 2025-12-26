import 'package:finance_tracking/database/database_helper.dart';
import 'package:finance_tracking/database/database_helper_impl.dart';
import 'package:finance_tracking/models/page_meta/page_meta.dart';
import 'package:finance_tracking/models/transaction_model/transaction_model.dart';
import 'package:finance_tracking/providers/transaction/transaction_state.dart';
import 'package:finance_tracking/utils/extensions.dart';
import 'package:finance_tracking/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_provider.g.dart';

@riverpod
class TransactionProvider extends _$TransactionProvider {
  late TextEditingController transactionNameController;
  late TextEditingController transactionDateController;
  late TextEditingController transactionAmountController;
  late TextEditingController fromLineChartDateController;
  late TextEditingController toLineChartDateController;
  late TextEditingController calenderMonthController;
  late GlobalKey<FormState> formKey;
  late DatabaseHelper databaseHelper;
  TransactionModel? arguementTransaction;

  @override
  TransactionState build({
    required WidgetRef widgetRef,
    TransactionModel? transaction,
  }) {
    initWidgets();
    arguementTransaction = transaction;
    databaseHelper = widgetRef.watch(databaseHelperProvider);
    return TransactionState.initial(eTransactionState: ETransactionState.ready);
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

  void updateBudgetCheck(bool value) {
    state = state.copyWith(isIncomeAddInBudget: value);
  }

  void updateValuesFromEditTransaction() {
    transactionNameController.text = arguementTransaction?.notes ?? "";
    transactionAmountController.text =
        (arguementTransaction?.amount ?? 0).toString();
    if (transaction?.date != null) {
      selectTransactionDate(DateTime.parse(transaction!.date!));
    }
    if (transaction?.type != null) {
      selectTransactionType(
        TransactionType.values.elementAt(transaction!.type!),
      );
    }
    if ((transaction?.categoryId != null)) {
      state = state.copyWith(selectedCategoryId: transaction?.categoryId);
    }
    setToInitialState();
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

  void selectTransactionCategory(int categoryId) {
    state = state.copyWith(selectedCategoryId: categoryId);
  }

  void selectTransactionType(TransactionType? type) {
    state = state.copyWith(selectedTransactionType: type);
  }

  void selectTransactionDate(DateTime date) {
    transactionDateController.text = Utility.formatDate(date);
    state = state.copyWith(selectedDate: date);
  }

  // @override
  // void dispose() {
  //   transactionNameController.dispose();
  //   transactionAmountController.dispose();
  //   transactionDateController.dispose();
  // }

  void initWidgets() {
    transactionNameController = TextEditingController();
    transactionDateController = TextEditingController();
    transactionAmountController = TextEditingController();
    calenderMonthController = TextEditingController();
    formKey = GlobalKey<FormState>();
    fromLineChartDateController = TextEditingController();
    toLineChartDateController = TextEditingController();
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
    state = state.copyWith(
      fromLineChartDate: DateTime(currentDate.year, currentDate.month, 1),
      transactions: [],
      calenderMonthtransactions: [],
      selectedCalenderMonth: currentDate,
      toLineChartDate: DateTime(
        currentDate.year,
        currentDate.month,
        lastDate.day,
      ),
    );
  }

  void resetWidgets() {
    transactionNameController.clear();
    transactionAmountController.clear();
    transactionDateController.clear();
    state = state.copyWith(selectedDate: null, selectedTransactionType: null);
  }

  Future<void> filterDashboard() async {
    state = state.copyWith(
      eTransactionState: ETransactionState.loadingDashboard,
    );
    await databaseHelper.initAppDatabase();
    await Future.wait([
          getDashboardTransactions(),
          getTransactionsForCalenderMonth(),
        ])
        .then((_) {
          setToInitialState();
        })
        .onError((e, trace) {
          state = state.copyWith(
            message: e.toString(),
            eTransactionState: ETransactionState.error,
          );
          setToInitialState();
        });
  }

  Future<void> getTransactions({bool loadMore = false}) async {
    state = state.copyWith(
      eTransactionState:
          loadMore ? ETransactionState.loadingMore : ETransactionState.loading,
    );
    if (!loadMore) {
      state = state.copyWith(pageMeta: PageMeta());
    }

    final result = await databaseHelper.getTransactions(
      amount: transactionAmountController.text.trim(),
      transactionName: transactionNameController.text.trim(),
      transactionType: state.selectedTransactionType?.index,
      pageMeta: state.pageMeta,
      transactionDate: Utility.getDateFromDateTime(state.selectedDate),
    );
    result.fold(
      (l) {
        state = state.copyWith(
          message: l,
          eTransactionState: ETransactionState.error,
        );
        setToInitialState();
      },
      (r) {
        state = state.copyWith(
          transactions: loadMore ? [...state.transactions, ...r] : r,
          pageMeta: state.pageMeta.copyWith(
            hasNext: r.length == state.pageMeta.limit,
            offset: state.pageMeta.offset + state.pageMeta.limit,
          ),
        );
        setToInitialState();
      },
    );
  }

  Future<void> getDashboardTransactions() async {
    state = state.copyWith(eTransactionState: ETransactionState.loading);

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

  Future<void> createTransaction() async {
    if (formKey.currentState!.validate()) {
      if (state.selectedCategoryId != null &&
          state.selectedDate != null &&
          state.selectedTransactionType != null) {
        state = state.copyWith(eTransactionState: ETransactionState.loading);
        final result = await databaseHelper.addTransaction(
          TransactionModel(
            amount: transactionAmountController.text.trim(),
            categoryId: state.selectedCategoryId,
            date: Utility.getDateFromDateTime(state.selectedDate!),
            notes: transactionNameController.text.trim(),
            type: state.selectedTransactionType!.index,
          ),
        );
        result.fold(
          (l) {
            state = state.copyWith(
              message: l,
              eTransactionState: ETransactionState.error,
            );
            setToInitialState();
          },
          (r) {
            state = state.copyWith(
              message: r,
              eTransactionState: ETransactionState.success,
            );
            setToInitialState();
          },
        );
      } else {
        state = state.copyWith(
          message: 'Please fill all the mandatory fields',
          eTransactionState: ETransactionState.error,
        );
        setToInitialState();
      }
    }
  }

  Future<void> editTransaction() async {
    if (formKey.currentState!.validate()) {
      if (state.selectedCategoryId != null &&
          state.selectedDate != null &&
          state.selectedTransactionType != null) {
        state = state.copyWith(eTransactionState: ETransactionState.loading);
        final result = await databaseHelper.editTransaction(
          TransactionModel(
            amount: transactionAmountController.text.trim(),
            categoryId: state.selectedCategoryId,
            date: Utility.getDateFromDateTime(state.selectedDate!),
            notes: transactionNameController.text.trim(),
            id: arguementTransaction?.id,
            type: state.selectedTransactionType!.index,
          ),
        );
        result.fold(
          (l) {
            state = state.copyWith(
              message: l,
              eTransactionState: ETransactionState.error,
            );
            setToInitialState();
          },
          (r) {
            state = state.copyWith(
              message: r,
              eTransactionState: ETransactionState.success,
            );
            setToInitialState();
          },
        );
      } else {
        state = state.copyWith(
          message: 'Please fill all the mandatory fields',
          eTransactionState: ETransactionState.error,
        );
        setToInitialState();
      }
    }
  }

  Future<void> deleteTransaction(int transactionId) async {
    state = state.copyWith(eTransactionState: ETransactionState.loading);
    final result = await databaseHelper.deleteTransaction(transactionId);
    result.fold(
      (l) {
        state = state.copyWith(
          message: l,
          eTransactionState: ETransactionState.error,
        );
        setToInitialState();
      },
      (r) {
        state = state.copyWith(
          message: r,
          eTransactionState: ETransactionState.successDelete,
        );
      },
    );
  }

  void setToInitialState() {
    state = state.copyWith(
      eTransactionState: ETransactionState.initial,
      message: null,
    );
  }
}
