import 'package:finance_tracking/components/custom_app_bar.dart';
import 'package:finance_tracking/components/custom_bottom_sheet.dart';
import 'package:finance_tracking/components/custom_button.dart';
import 'package:finance_tracking/models/transaction_model/transaction_model.dart';
import 'package:finance_tracking/providers/transaction/transaction_provider.dart';
import 'package:finance_tracking/providers/transaction/transaction_state.dart';
import 'package:finance_tracking/screens/home/provider/home_state.dart';
import 'package:finance_tracking/screens/home/ui/create_bottom_sheet.dart';
import 'package:finance_tracking/screens/transaction_list/ui/transactions_filter.dart';
import 'package:finance_tracking/screens/transaction_list/ui/transction_options_bottom_sheet.dart';
import 'package:finance_tracking/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class TransactionList extends ConsumerWidget {
  const TransactionList({
    super.key,
    required this.fromDashboard,
    this.transactionDate,
  });

  final bool fromDashboard;
  final DateTime? transactionDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionRef = transactionProviderProvider(widgetRef: ref);
    final provider = ref.watch(transactionRef.notifier);
    final state = ref.watch(transactionRef);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state.eTransactionState == ETransactionState.ready) {
        if (transactionDate != null) {
          provider.selectTransactionDate(transactionDate!);
        }
        provider.getTransactions();
      }
    });
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: Utility.getCurrentTabLabel(HomeTabs.transaction),
        actions: [
          IconButton(
            onPressed: () {
              customBottomSheet(
                context: context,
                child: TransactionsFilter(transactionRef: transactionRef),
                isDismissible: false,
                enableDrag: false,
                onSuccess: (value) {
                  if (((value != null) && (value is ESearchType))) {
                    switch (value) {
                      case ESearchType.filter:
                        provider.getTransactions();
                        break;
                      case ESearchType.reset:
                        provider.resetWidgets();
                        provider.getTransactions();
                        break;
                    }
                  }
                },
              );
            },
            icon: Icon(
              Icons.filter_alt_rounded,
              size: MediaQuery.of(context).size.height * .03,
            ),
          ),
          if (fromDashboard)
            IconButton(
              onPressed: () {
                showCreateBottomSheet(context);
              },
              icon: Icon(
                Icons.add,
                size: MediaQuery.of(context).size.height * .035,
              ),
            ),
        ],
      ),

      body: LazyLoadScrollView(
        onEndOfPage: () {
          if (state.pageMeta.hasNext &&
              state.eTransactionState == ETransactionState.initial) {
            provider.getTransactions(loadMore: true);
          }
        },
        child: RefreshIndicator(
          onRefresh: () async {
            if (state.eTransactionState == ETransactionState.initial) {
              provider.getTransactions();
            }
          },
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            children: [
              state.eTransactionState == ETransactionState.loading ||
                      state.eTransactionState == ETransactionState.ready
                  ? SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: Center(child: CircularProgressIndicator()),
                  )
                  : state.transactions.isEmpty
                  ? SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: Center(child: Text('No transaction found.')),
                  )
                  : ListView.builder(
                    itemCount: state.transactions.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = state.transactions[index];

                      return customTransactionTile(
                        parentContext: context,
                        transactionModel: item,
                        onDelete: (val) {
                          if (((val == true) && (item.id != null))) {
                            deleteTransactionDialogBox(
                              context: context,
                              refProvider: transactionRef,
                              transactionId: item.id!,
                            );
                          }
                        },
                      );
                    },
                  ),
              if (state.eTransactionState == ETransactionState.loadingMore)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Center(child: CircularProgressIndicator()),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customTransactionTile({
    required BuildContext parentContext,
    required TransactionModel transactionModel,
    required dynamic Function(dynamic)? onDelete,
  }) {
    final TransactionType? transactionType =
        transactionModel.type != null
            ? TransactionType.values.elementAt(transactionModel.type!)
            : null;
    return ListTile(
      onTap: () {
        customBottomSheet(
          context: parentContext,
          topPadding: 0,
          onSuccess: onDelete,
          child: TransctionOptionsBottomSheet(
            transactionModel: transactionModel,
          ),
        );
      },
      title: Text(
        transactionModel.notes ?? 'N/A',
        style: TextStyle(fontSize: 17),
      ),
      subtitle: Text(
        transactionModel.date != null
            ? Utility.formatDate(DateTime.parse(transactionModel.date!))
            : 'N/A',
        style: TextStyle(fontSize: 15),
      ),
      trailing: Text(
        transactionModel.amount != null && transactionType != null
            ? '${transactionType == TransactionType.expense ? '- ' : '+ '}${transactionModel.amount}'
            : 'N/A',
        style: TextStyle(
          fontSize: 18,
          color:
              transactionType != null
                  ? transactionType == TransactionType.expense
                      ? Colors.red
                      : Colors.green
                  : null,
        ),
      ),
    );
  }

  void deleteTransactionDialogBox({
    required BuildContext context,
    required TransactionProviderProvider refProvider,
    required int transactionId,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return PopScope(
          child: Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(refProvider);
              final provider = ref.watch(refProvider.notifier);
              return AlertDialog(
                backgroundColor: Colors.white,
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomButton(
                        onTap: () {
                          provider.deleteTransaction(transactionId);
                        },
                        label: "Delete",
                        isLoading:
                            state.eTransactionState ==
                            ETransactionState.loading,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: CustomButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        label: "Cancel",
                        isDisabled:
                            state.eTransactionState ==
                            ETransactionState.loading,
                        isSecondary: true,
                      ),
                    ),
                  ],
                ),
                scrollable: true,
                title: Text(
                  "Are you sure you want to delete this transaction?",
                  style: TextStyle(fontSize: 18),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
