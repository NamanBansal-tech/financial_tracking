import 'package:finance_tracking/providers/budget/budget_provider.dart';
import 'package:finance_tracking/providers/budget/budget_state.dart';
import 'package:finance_tracking/providers/category/category_provider.dart';
import 'package:finance_tracking/providers/category/category_state.dart';
import 'package:finance_tracking/providers/common_provider/common_state.dart';
import 'package:finance_tracking/providers/transaction/transaction_provider.dart';
import 'package:finance_tracking/providers/transaction/transaction_state.dart';
import 'package:finance_tracking/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Listeners {
  static void transactionListener({
    required BuildContext context,
    required TransactionState state,
    required TransactionProvider provider,
    bool fromCreateTransactionPage = false,
  }) {
    if (state.eState == EState.error && state.message != null) {
      Fluttertoast.showToast(
        msg: state.message!,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
    if (state.eState == EState.successDelete && state.message != null) {
      Fluttertoast.showToast(
        msg: state.message!,
        backgroundColor: Colors.green,
      );
      provider.getTransactions();
    }
    if (state.eState == EState.success && state.message != null) {
      Fluttertoast.showToast(
        msg: state.message!,
        backgroundColor: Colors.green,
      );
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
      Fluttertoast.showToast(
        msg: state.message!,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
    if (state.eState == EState.successDelete && state.message != null) {
      Fluttertoast.showToast(
        msg: state.message!,
        backgroundColor: Colors.green,
      );
      provider.getCategories();
    }
    if (state.eState == EState.success && state.message != null) {
      Fluttertoast.showToast(
        msg: state.message!,
        backgroundColor: Colors.green,
      );
      if ((fromOtherPage)) {
        Navigator.pop(context, true);
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
      Fluttertoast.showToast(
        msg: state.message!,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
    if (state.eState == EState.successDelete && state.message != null) {
      Fluttertoast.showToast(
        msg: state.message!,
        backgroundColor: Colors.green,
      );
      provider.getBudgetList();
    }
    if (state.eState == EState.success && state.message != null) {
      Fluttertoast.showToast(
        msg: state.message!,
        backgroundColor: Colors.green,
      );
      if ((fromOtherPage)) {
        Navigator.pop(context, true);
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
      Fluttertoast.showToast(
        msg: state.message!,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }
}
