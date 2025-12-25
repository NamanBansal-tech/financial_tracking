import 'package:finance_tracking/screens/transaction_list/ui/transaction_list.dart';
import 'package:flutter/material.dart';

class TransactionsListPage extends StatelessWidget {
  const TransactionsListPage({super.key, required this.transactionDate});

  final DateTime transactionDate;

  static Route<dynamic> route({required DateTime transactionDate}) {
    return MaterialPageRoute(
      builder: (_) => TransactionsListPage(transactionDate: transactionDate),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TransactionList(fromDashboard: true, transactionDate: transactionDate);
  }
}
