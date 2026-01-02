import 'package:finance_tracking/components/custom_app_bar.dart';
import 'package:finance_tracking/components/custom_bottom_sheet.dart';
import 'package:finance_tracking/components/custom_button.dart';
import 'package:finance_tracking/models/transaction_model/transaction_model.dart';
import 'package:finance_tracking/providers/budget/budget_provider.dart';
import 'package:finance_tracking/providers/category/category_state.dart';
import 'package:finance_tracking/providers/common_provider/common_state.dart';
import 'package:finance_tracking/providers/transaction/transaction_provider.dart';
import 'package:finance_tracking/providers/transaction/transaction_state.dart';
import 'package:finance_tracking/screens/create_transaction/create_transaction_page.dart';
import 'package:finance_tracking/screens/transaction_list/ui/transactions_filter.dart';
import 'package:finance_tracking/screens/transaction_list/ui/transction_options_bottom_sheet.dart';
import 'package:finance_tracking/utils/app_colors.dart';
import 'package:finance_tracking/utils/extensions.dart';
import 'package:finance_tracking/utils/listeners.dart';
import 'package:finance_tracking/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class TransactionList extends ConsumerWidget {
  const TransactionList({
    super.key,
    required this.fromDashboard,
    this.transactionDate,
    this.categoryId,
    this.budgetId,
  });

  final bool fromDashboard;
  final DateTime? transactionDate;
  final int? categoryId;
  final int? budgetId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionRef = transactionProviderProvider(widgetRef: ref);
    final provider = ref.read(transactionRef.notifier);
    final state = ref.watch(transactionRef);
    final budgetRef = budgetProviderProvider(widgetRef: ref);
    final budgetProvider = ref.read(budgetRef.notifier);
    final budgetState = ref.watch(budgetRef);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if ((state.eState == EState.ready)) {
        if ((transactionDate != null)) {
          provider.selectTransactionDate(transactionDate!);
        }
        if ((categoryId != null)) {
          provider.updateCategoryId(categoryId);
        }
        if ((budgetId != null)) {
          provider.updateBudgetId(budgetId);
          if ((budgetState.eState == EState.ready)) {
            budgetProvider.getBudget(budgetId!);
          }
        }
        provider.getTransactions();
      }
    });
    ref.listen<TransactionState>(
      (transactionRef),
      (_, next) => Listeners.transactionListener(
        context: context,
        state: next,
        provider: provider,
      ),
    );
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
            icon: Icon(Icons.filter_alt_rounded, size: context.height * .03),
          ),
          if (fromDashboard)
            IconButton(
              onPressed: () {
                Navigator.push(context, CreateTransactionPage.route());
              },
              icon: Icon(Icons.add, size: context.height * .035),
            ),
        ],
      ),

      body: LazyLoadScrollView(
        onEndOfPage: () {
          if (state.pageMeta.hasNext && state.eState == EState.initial) {
            provider.getTransactions(loadMore: true);
          }
        },
        child: RefreshIndicator(
          onRefresh: () async {
            if (state.eState == EState.initial) {
              provider.getTransactions();
            }
          },
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 12.w),
            children: [
              if ((state.transactions.isNotEmpty)) ...[
                headerWidget(
                  totalExpense: state.totalExpense,
                  totalIncome: state.totalIncome,
                  budget: budgetState.budget?.budgetAmount,
                  isBudgetLoading: (budgetState.eState == EState.loading),
                ),
              ],
              ((state.eState == EState.loading) ||
                      (state.eState == EState.ready))
                  ? SizedBox(
                      height: context.height / 1.5,
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : state.transactions.isEmpty
                  ? SizedBox(
                      height: context.height / 1.5,
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
                          isDeleting: state.eState == EState.loading,
                          onDelete: (val) {
                            if (((val == true) && (item.id != null))) {
                              deleteTransactionDialogBox(
                                context: context,
                                refProvider: transactionRef,
                              ).then((value) {
                                if ((value == true)) {
                                  provider.deleteTransaction(item.id!);
                                }
                              });
                            }
                          },
                        );
                      },
                    ),
              if (state.eState == EState.loadingMore)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: Center(child: CircularProgressIndicator()),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerWidget({
    required num totalExpense,
    required num totalIncome,
    required num? budget,
    required bool isBudgetLoading,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300, width: 1.w),
      ),
      padding: EdgeInsets.all(16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _amountTile(
            label: 'Total Expenses',
            value: totalExpense,
            color: AppColors.expenseColor,
          ),
          if ((budget != null)) ...[
            _amountTile(
              label: 'Total Budget',
              value: budget,
              color: Colors.black87,
            ),
          ],
          _amountTile(
            label: 'Total Income',
            value: totalIncome,
            color: AppColors.incomeColor,
          ),
        ],
      ),
    );
  }

  Widget _amountTile({
    required String label,
    required num value,
    required Color color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
        ),
        SizedBox(height: 4.h),
        Text(
          value.toStringAsFixed(0),
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget customTransactionTile({
    required BuildContext parentContext,
    required TransactionModel transactionModel,
    required dynamic Function(dynamic)? onDelete,
    required bool isDeleting,
  }) {
    final TransactionType? transactionType = transactionModel.type != null
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
        transactionModel.name ?? 'N/A',
        style: TextStyle(fontSize: 17.sp),
      ),
      subtitle: Text(
        transactionModel.date != null
            ? Utility.formatDate(DateTime.parse(transactionModel.date!))
            : 'N/A',
        style: TextStyle(fontSize: 15.sp),
      ),
      trailing: isDeleting
          ? const CircularProgressIndicator()
          : Text(
              transactionModel.amount != null && transactionType != null
                  ? '${transactionType == TransactionType.expense ? '- ' : '+ '}${transactionModel.amount}'
                  : 'N/A',
              style: TextStyle(
                fontSize: 18.sp,
                color: transactionType != null
                    ? transactionType == TransactionType.expense
                          ? Colors.red
                          : Colors.green
                    : null,
              ),
            ),
    );
  }

  Future<dynamic> deleteTransactionDialogBox({
    required BuildContext context,
    required TransactionProviderProvider refProvider,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return PopScope(
          child: Consumer(
            builder: (context, ref, child) {
              return AlertDialog(
                backgroundColor: Colors.white,
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomButton(
                        onTap: () {
                          Navigator.pop(context, true);
                        },
                        label: "Delete",
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Expanded(
                      child: CustomButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        label: "Cancel",
                        isSecondary: true,
                      ),
                    ),
                  ],
                ),
                scrollable: true,
                title: Text(
                  "Are you sure you want to delete this transaction ?",
                  style: TextStyle(fontSize: 18.sp),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
