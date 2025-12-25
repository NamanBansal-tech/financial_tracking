import 'package:finance_tracking/providers/category/category_provider.dart';
import 'package:finance_tracking/providers/category/category_state.dart';
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
    if (state.eTransactionState == ETransactionState.error &&
        state.message != null) {
      Fluttertoast.showToast(
        msg: state.message!,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
    if (state.eTransactionState == ETransactionState.successDelete &&
        state.message != null) {
      Fluttertoast.showToast(
        msg: state.message!,
        backgroundColor: Colors.green,
      );
      Navigator.pop(context);
      provider.getTransactions();
    }
  }

  static void categoryListener({
    required BuildContext context,
    required CategoryState state,
    required CategoryProvider provider,
    bool popTillDashboard = false,
  }) {
    if (state.eCategoryState == ECategoryState.error && state.message != null) {
      Fluttertoast.showToast(
        msg: state.message!,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
    if (state.eCategoryState == ECategoryState.successDelete &&
        state.message != null) {
      Fluttertoast.showToast(
        msg: state.message!,
        backgroundColor: Colors.green,
      );
      Navigator.pop(context);
      provider.getCategories();
    }
    if (state.eCategoryState == ECategoryState.success &&
        state.message != null) {
      Fluttertoast.showToast(
        msg: state.message!,
        backgroundColor: Colors.green,
      );
      if (popTillDashboard) {
        Navigator.pushAndRemoveUntil(context, HomePage.route(), (_) => false);
      } else {
        Navigator.pop(context, true);
      }
    }
  }
}
