import 'package:finance_tracking/screens/transaction_list/ui/transaction_list.dart';
import 'package:flutter/material.dart';

class TransactionsListPage extends StatelessWidget {
  const TransactionsListPage({
    super.key,
    this.transactionDate,
    this.categoryId,
    this.budgetId,
    this.fromDashboard = false,
  });

  final DateTime? transactionDate;
  final int? categoryId;
  final int? budgetId;
  final bool fromDashboard;

  static Route<dynamic> route({
    DateTime? transactionDate,
    int? categoryId,
    int? budgetId,
    bool fromDashboard = false,
  }) {
    return MaterialPageRoute(
      builder: (_) => TransactionsListPage(
        transactionDate: transactionDate,
        categoryId: categoryId,
        budgetId: budgetId,
        fromDashboard: fromDashboard,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TransactionList(
      fromDashboard: fromDashboard,
      transactionDate: transactionDate,
      categoryId: categoryId,
      budgetId: budgetId,
    );
  }
}
