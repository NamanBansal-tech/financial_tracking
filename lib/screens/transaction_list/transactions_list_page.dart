import 'package:finance_tracking/screens/transaction_list/ui/transaction_list.dart';
import 'package:flutter/material.dart';

class TransactionsListPage extends StatelessWidget {
  const TransactionsListPage({
    super.key,
    this.transactionDate,
    this.categoryId,
    this.budgetId,
  });

  final DateTime? transactionDate;
  final int? categoryId;
  final int? budgetId;

  static Route<dynamic> route({
    DateTime? transactionDate,
    int? categoryId,
    int? budgetId,
  }) {
    return MaterialPageRoute(
      builder: (_) => TransactionsListPage(
        transactionDate: transactionDate,
        categoryId: categoryId,
        budgetId: budgetId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TransactionList(
      fromDashboard: true,
      transactionDate: transactionDate,
      categoryId: categoryId,
      budgetId: budgetId,
    );
  }
}
