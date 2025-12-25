import 'package:finance_tracking/models/transaction_model/transaction_model.dart';
import 'package:finance_tracking/screens/create_transaction/ui/create_transaction_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateTransactionPage extends StatelessWidget {
  const CreateTransactionPage({super.key, this.transactionModel});

  final TransactionModel? transactionModel;

  static Route<dynamic> route({TransactionModel? transactionModel}) {
    return MaterialPageRoute(
      builder: (_) => CreateTransactionPage(transactionModel: transactionModel),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: CreateTransactionBody(transactionModel: transactionModel),
    );
  }
}
