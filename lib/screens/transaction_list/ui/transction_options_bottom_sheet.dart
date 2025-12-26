import 'package:finance_tracking/models/transaction_model/transaction_model.dart';
import 'package:finance_tracking/screens/create_transaction/create_transaction_page.dart';
import 'package:flutter/material.dart';

class TransctionOptionsBottomSheet extends StatelessWidget {
  const TransctionOptionsBottomSheet({
    super.key,
    required this.transactionModel,
  });

  final TransactionModel transactionModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(Icons.edit),
            title: Text("Edit"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                CreateTransactionPage.route(transactionModel: transactionModel),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text("Delete"),
            onTap: () {
              Navigator.pop(context, true);
            },
          ),
        ],
      ),
    );
  }
}
