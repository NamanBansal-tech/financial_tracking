import 'package:finance_tracking/components/custom_app_bar.dart';
import 'package:finance_tracking/components/custom_bottom_sheet.dart';
import 'package:finance_tracking/providers/category/category_provider.dart';
import 'package:finance_tracking/providers/category/category_state.dart';
import 'package:finance_tracking/providers/transaction/transaction_provider.dart';
import 'package:finance_tracking/providers/transaction/transaction_state.dart';
import 'package:finance_tracking/screens/home/provider/home_state.dart';
import 'package:finance_tracking/screens/home/ui/budget_chart.dart';
import 'package:finance_tracking/screens/home/ui/calender_widget.dart';
import 'package:finance_tracking/screens/home/ui/create_bottom_sheet.dart';
import 'package:finance_tracking/screens/home/ui/dashboard_filter.dart';
import 'package:finance_tracking/screens/home/ui/transactions_line_chart.dart';
import 'package:finance_tracking/utils/listeners.dart';
import 'package:finance_tracking/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashBoardPage extends ConsumerWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionRef = transactionProviderProvider(widgetRef: ref);
    final categoryRef = categoryProviderProvider(
      widgetRef: ref,
    );
    final transactionProvider = ref.watch(transactionRef.notifier);
    final categoryState = ref.watch(categoryRef);
    final transactionState = ref.watch(transactionRef);
    final categoryProvider = ref.watch(categoryRef.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (transactionState.eTransactionState == ETransactionState.ready) {
        transactionProvider.updateDashboardValues();
        transactionProvider.filterDashboard();
      }
    });
    ref.listen<TransactionState>(
      (transactionRef),
      (_, next) => Listeners.transactionListener(
        context: context,
        state: next,
        provider: transactionProvider,
      ),
    );
    ref.listen<CategoryState>(
      (categoryRef),
      (_, next) => Listeners.categoryListener(
        context: context,
        state: next,
        provider: categoryProvider,
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: Utility.getCurrentTabLabel(HomeTabs.dashboard),
        actions: [
          IconButton(
            onPressed: () {
              customBottomSheet(
                context: context,
                child: DashboardFilter(
                  categoryRef: categoryRef,
                  transactionRef: transactionRef,
                ),
                isDismissible: false,
                enableDrag: false,
              );
            },
            icon: Icon(
              Icons.filter_alt_rounded,
              size: MediaQuery.of(context).size.height * .03,
            ),
          ),
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

      body:
          transactionState.eTransactionState ==
                      ETransactionState.loadingDashboard ||
                  categoryState.eCategoryState == ECategoryState.loading ||
                  transactionState.eTransactionState == ETransactionState.ready
              ? SizedBox(
                height: MediaQuery.of(context).size.height / 1.5,
                child: Center(child: CircularProgressIndicator()),
              )
              : ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
                children: [
                  Text(
                    "Transactions Summary",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  TransactionsLineChart(
                    transactions: transactionState.graphTransactions,
                  ),
                  SizedBox(height: 16),
                  if (transactionState.selectedCalenderMonth != null)
                    CalenderWidget(
                      selectedMonth: transactionState.selectedCalenderMonth!,
                      transactions: transactionState.calenderMonthtransactions,
                    ),
                  SizedBox(height: 16),
                  if (categoryState.category != null &&
                      categoryState.category?.budgetAmount != null)
                    BudgetChart(category: categoryState.category!),
                ],
              ),
    );
  }
}
