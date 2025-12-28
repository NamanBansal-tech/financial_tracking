import 'package:finance_tracking/providers/budget/budget_provider.dart';
import 'package:finance_tracking/providers/budget/budget_state.dart';
import 'package:finance_tracking/providers/category/category_provider.dart';
import 'package:finance_tracking/providers/category/category_state.dart';
import 'package:finance_tracking/providers/common_provider/common_provider.dart';
import 'package:finance_tracking/providers/common_provider/common_state.dart';
import 'package:finance_tracking/providers/transaction/transaction_provider.dart';
import 'package:finance_tracking/providers/transaction/transaction_state.dart';
import 'package:finance_tracking/screens/budget_list/ui/budget_list.dart';
import 'package:finance_tracking/screens/category_list/ui/categories_list.dart';
import 'package:finance_tracking/screens/home/ui/bottom_navigation_bar.dart';
import 'package:finance_tracking/screens/dashboard/dashboard_page.dart';
import 'package:finance_tracking/screens/transaction_list/ui/transaction_list.dart';
import 'package:finance_tracking/utils/listeners.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (_) => ProviderScope(child: HomePage()));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commonRef = commonProviderProvider(widgetRef: ref);
    final transactionRef = transactionProviderProvider(widgetRef: ref);
    final categoryRef = categoryProviderProvider(widgetRef: ref);
    final budgetRef = budgetProviderProvider(widgetRef: ref);
    final provider = ref.read<CommonProvider>(commonRef.notifier);
    final state = ref.watch<CommonState>(commonRef);
    final transactionProvider = ref.read(transactionRef.notifier);
    final categoryProvider = ref.read(categoryRef.notifier);
    final budgetProvider = ref.read(budgetRef.notifier);
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
    ref.listen<BudgetState>(
      (budgetRef),
      (_, next) => Listeners.budgetListener(
        context: context,
        state: next,
        provider: budgetProvider,
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: switch (state.currentTab) {
        HomeTabs.dashboard => DashBoardPage(),
        HomeTabs.transaction => TransactionList(fromDashboard: true),
        HomeTabs.category => CategoriesList(fromOtherPage: false),
        HomeTabs.budget => BudgetList(fromOtherPage: false),
      },
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: state.currentTab.index,
        onTap: (val) {
          final currentTab = HomeTabs.values.elementAt(val);
          switch (currentTab) {
            case HomeTabs.dashboard:
              provider.filterDashboard();
              break;
            case HomeTabs.transaction:
              transactionProvider.getTransactions();
              break;
            case HomeTabs.category:
              categoryProvider.getCategories();
              break;
            case HomeTabs.budget:
              budgetProvider.getBudgetList();
              break;
          }
          provider.updateBottomNavigationBarIndex(currentTab);
        },
      ),
    );
  }
}
