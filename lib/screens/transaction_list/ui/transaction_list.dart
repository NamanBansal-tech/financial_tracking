import 'package:finance_tracking/components/common_delete_dialog_box.dart';
import 'package:finance_tracking/components/common_options_bottom_sheet.dart';
import 'package:finance_tracking/components/custom_app_bar.dart';
import 'package:finance_tracking/components/custom_bottom_sheet.dart';
import 'package:finance_tracking/models/transaction_model/transaction_model.dart';
import 'package:finance_tracking/providers/budget/budget_provider.dart';
import 'package:finance_tracking/providers/category/category_provider.dart';
import 'package:finance_tracking/providers/category/category_state.dart';
import 'package:finance_tracking/providers/common_provider/common_state.dart';
import 'package:finance_tracking/providers/transaction/transaction_provider.dart';
import 'package:finance_tracking/providers/transaction/transaction_state.dart';
import 'package:finance_tracking/screens/create_transaction/create_transaction_page.dart';
import 'package:finance_tracking/screens/transaction_list/ui/transactions_filter.dart';
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
    final categoryRef = categoryProviderProvider(widgetRef: ref);
    final categoryProvider = ref.read(categoryRef.notifier);
    final categoryState = ref.watch(categoryRef);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if ((state.eState == EState.ready)) {
        if ((transactionDate != null)) {
          provider.selectTransactionDate(transactionDate!);
        }
        if ((categoryId != null)) {
          provider.updateCategoryId(categoryId);
          if ((categoryState.eState == EState.ready)) {
            categoryProvider.getCategory(categoryId!);
          }
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
                child: TransactionsFilter(
                  transactionRef: transactionRef,
                  budgetRef: budgetRef,
                  categoryRef: categoryRef,
                ),
                isDismissible: false,
                enableDrag: false,
                onSuccess: (value) {
                  if (((value != null) && (value is ESearchType))) {
                    switch (value) {
                      case ESearchType.filter:
                        {
                          provider.getTransactions();
                          break;
                        }
                      case ESearchType.reset:
                        {
                          provider.resetWidgets();
                          categoryProvider.updateSelectedCategory(null);
                          budgetProvider.updateSelectedBudget(null);
                          provider.getTransactions();
                          break;
                        }
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
                          onDelete: () {
                            deleteDialogBox(
                              context: context,
                              title:
                                  "Are you sure you want to delete this transaction ?",
                            ).then((value) {
                              if ((value == true)) {
                                provider.deleteTransaction(item.id!);
                              }
                            });
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
    required dynamic Function() onDelete,
    required bool isDeleting,
  }) {
    final TransactionType? transactionType = transactionModel.type != null
        ? TransactionType.values.elementAt(transactionModel.type!)
        : null;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  transactionModel.name ?? 'N/A',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              Text(
                transactionModel.amount != null && transactionType != null
                    ? '${transactionType == TransactionType.expense ? '- ' : '+ '}${transactionModel.amount}'
                    : 'N/A',
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                  color: transactionType == TransactionType.expense
                      ? AppColors.expenseColor
                      : AppColors.incomeColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  transactionModel.date != null
                      ? Utility.formatDate(
                          DateTime.parse(transactionModel.date!),
                        )
                      : 'N/A',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              isDeleting
                  ? const CircularProgressIndicator()
                  : CommonOptions(
                      showViewTransactions: false,
                      onDelete: () {
                        onDelete();
                      },
                      onEdit: () {
                        Navigator.push(
                          parentContext,
                          CreateTransactionPage.route(
                            transactionModel: transactionModel,
                          ),
                        );
                      },
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
