import 'package:finance_tracking/database/database_helper.dart';
import 'package:finance_tracking/database/database_helper_impl.dart';
import 'package:finance_tracking/models/page_meta/page_meta.dart';
import 'package:finance_tracking/models/transaction_model/transaction_model.dart';
import 'package:finance_tracking/providers/category/category_state.dart';
import 'package:finance_tracking/providers/transaction/transaction_state.dart';
import 'package:finance_tracking/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_provider.g.dart';

@riverpod
class TransactionProvider extends _$TransactionProvider {
  late TextEditingController nameController;
  late TextEditingController dateController;
  late TextEditingController amountController;
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
    return TransactionState.initial(eState: EState.ready);
  }

  void updateBudgetCheck(bool value) {
    state = state.copyWith(isIncomeAddInBudget: value);
  }

  void updateValuesFromEditTransaction() {
    nameController.text = arguementTransaction?.name ?? "";
    amountController.text = (arguementTransaction?.amount ?? 0).toString();
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
    if ((transaction?.budgetId != null)) {
      state = state.copyWith(selectedBudgetId: transaction?.budgetId);
    }
    setToInitialState();
  }

  void selectTransactionType(TransactionType? type) {
    state = state.copyWith(selectedTransactionType: type);
  }

  void selectTransactionDate(DateTime date) {
    dateController.text = Utility.formatDate(date);
    state = state.copyWith(selectedDate: date);
  }

  void updateBudgetId(int? id) {
    state = state.copyWith(selectedBudgetId: id);
  }

  void updateCategoryId(int? id) {
    state = state.copyWith(selectedCategoryId: id);
  }

  void initWidgets() {
    nameController = TextEditingController();
    dateController = TextEditingController();
    amountController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  void resetWidgets() {
    nameController.clear();
    amountController.clear();
    dateController.clear();
    state = state.copyWith(selectedDate: null, selectedTransactionType: null);
  }

  Future<void> getTransactions({bool loadMore = false}) async {
    state = state.copyWith(
      eState: loadMore ? EState.loadingMore : EState.loading,
    );
    if (!loadMore) {
      state = state.copyWith(pageMeta: PageMeta());
    }

    final result = await databaseHelper.getTransactions(
      amount: amountController.text.trim(),
      transactionName: nameController.text.trim(),
      transactionType: state.selectedTransactionType?.index,
      pageMeta: state.pageMeta,
      transactionDate: Utility.getDateFromDateTime(state.selectedDate),
      budgetId: state.selectedBudgetId,
      categoryId: state.selectedCategoryId,
    );
    result.fold(
      (l) {
        state = state.copyWith(message: l, eState: EState.error);
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

  Future<void> createTransaction() async {
    if (formKey.currentState!.validate()) {
      state = state.copyWith(eState: EState.loading);
      final result = await databaseHelper.addTransaction(
        TransactionModel(
          amount: num.tryParse(amountController.text.trim()),
          categoryId: state.selectedCategoryId,
          date: Utility.getDateFromDateTime(state.selectedDate!),
          name: nameController.text.trim(),
          type: state.selectedTransactionType!.index,
          budgetId: state.selectedBudgetId,
        ),
      );
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

  Future<void> editTransaction() async {
    if (formKey.currentState!.validate()) {
      state = state.copyWith(eState: EState.loading);
      final result = await databaseHelper.editTransaction(
        TransactionModel(
          amount: num.tryParse(amountController.text.trim()),
          categoryId: state.selectedCategoryId,
          date: Utility.getDateFromDateTime(state.selectedDate!),
          name: nameController.text.trim(),
          id: arguementTransaction?.id,
          type: state.selectedTransactionType!.index,
          budgetId: state.selectedBudgetId,
        ),
      );
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

  Future<void> deleteTransaction(int transactionId) async {
    state = state.copyWith(eState: EState.loading);
    final result = await databaseHelper.deleteTransaction(transactionId);
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

  void setToInitialState() {
    state = state.copyWith(eState: EState.initial, message: null);
  }
}
