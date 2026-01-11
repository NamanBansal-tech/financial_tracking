import 'package:finance_tracking/providers/budget/budget_provider.dart';
import 'package:finance_tracking/providers/budget/budget_state.dart';
import 'package:finance_tracking/providers/category/category_provider.dart';
import 'package:finance_tracking/providers/category/category_state.dart';
import 'package:finance_tracking/providers/common_provider/common_state.dart';
import 'package:finance_tracking/providers/transaction/transaction_provider.dart';
import 'package:finance_tracking/providers/transaction/transaction_state.dart';
import 'package:finance_tracking/screens/home/home_page.dart';
import 'package:finance_tracking/utils/toast_utils.dart';
import 'package:flutter/material.dart';

class Listeners {
  static void transactionListener({
    required BuildContext context,
    required TransactionState state,
    required TransactionProvider provider,
    bool fromCreateTransactionPage = false,
  }) {
    if (state.eState == EState.error && state.message != null) {
      ToastUtils.showErrorToast(message: state.message!);
    }
    if (state.eState == EState.successDelete && state.message != null) {
      ToastUtils.showSuccessToast(message: state.message!);
      provider.getTransactions();
    }
    if (state.eState == EState.success && state.message != null) {
      ToastUtils.showSuccessToast(message: state.message!);
      Navigator.pushAndRemoveUntil(context, HomePage.route(), (_) => false);
    }
  }

  static void categoryListener({
    required BuildContext context,
    required CategoryState state,
    required CategoryProvider provider,
    bool fromOtherPage = false,
  }) {
    if (state.eState == EState.error && state.message != null) {
      ToastUtils.showErrorToast(message: state.message!);
    }
    if (state.eState == EState.successDelete && state.message != null) {
      ToastUtils.showSuccessToast(message: state.message!);

      provider.getCategories();
    }
    if (state.eState == EState.success && state.message != null) {
      ToastUtils.showSuccessToast(message: state.message!);
      if ((fromOtherPage)) {
        Navigator.pop(context, state.resultId);
      } else {
        Navigator.pushAndRemoveUntil(context, HomePage.route(), (_) => false);
      }
    }
  }

  static void budgetListener({
    required BuildContext context,
    required BudgetState state,
    required BudgetProvider provider,
    bool fromOtherPage = false,
  }) {
    if (state.eState == EState.error && state.message != null) {
      ToastUtils.showErrorToast(message: state.message!);
    }
    if (state.eState == EState.successDelete && state.message != null) {
      ToastUtils.showSuccessToast(message: state.message!);
      provider.getBudgetList();
    }
    if (state.eState == EState.success && state.message != null) {
      ToastUtils.showSuccessToast(message: state.message!);
      if ((fromOtherPage)) {
        Navigator.pop(context, state.resultId);
      } else {
        Navigator.pushAndRemoveUntil(context, HomePage.route(), (_) => false);
      }
    }
  }

  static void commonListener({
    required BuildContext context,
    required CommonState state,
  }) {
    if (state.eState == EState.error && state.message != null) {
      ToastUtils.showErrorToast(message: state.message!);
    }
  }
}
