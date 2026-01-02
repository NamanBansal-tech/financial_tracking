import 'package:finance_tracking/providers/category/category_state.dart';
import 'package:flutter/material.dart';

class CommonOptionsBottomSheet extends StatelessWidget {
  const CommonOptionsBottomSheet({
    super.key,
    required this.fromOtherPage,
    required this.onEdit,
  });

  final bool fromOtherPage;
  final void Function()? onEdit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (fromOtherPage)
            ListTile(
              leading: Icon(Icons.check),
              title: Text("Select"),
              onTap: () {
                Navigator.pop(context, EMoreOptions.select);
              },
            ),
          ListTile(
            leading: Icon(Icons.show_chart_rounded),
            title: Text("Show Transactions"),
            onTap: () {
              Navigator.pop(context, EMoreOptions.viewTransactions);
            },
          ),

          ListTile(
            leading: Icon(Icons.edit),
            title: Text("Edit"),
            onTap: onEdit,
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text("Delete"),
            onTap: () {
              Navigator.pop(context, EMoreOptions.delete);
            },
          ),
        ],
      ),
    );
  }
}
