import 'package:finance_tracking/providers/category/category_provider.dart';
import 'package:finance_tracking/providers/category/category_state.dart';
import 'package:finance_tracking/providers/transaction/transaction_provider.dart';
import 'package:finance_tracking/providers/transaction/transaction_state.dart';
import 'package:finance_tracking/screens/categorie_list/ui/categories_list.dart';
import 'package:finance_tracking/screens/home/provider/home_provider.dart';
import 'package:finance_tracking/screens/home/provider/home_state.dart';
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
    final state = ref.watch(homeProviderProvider);
    final provider = ref.watch(homeProviderProvider.notifier);
    final transactionRef = transactionProviderProvider(widgetRef: ref);
    final categoryRef = categoryProviderProvider(
      widgetRef: ref,
    );
    final transactionProvider = ref.watch(transactionRef.notifier);
    final categoryProvider = ref.watch(categoryRef.notifier);
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
      body: switch (state.currentTab) {
        HomeTabs.dashboard => DashBoardPage(),
        HomeTabs.transaction => TransactionList(fromDashboard: true),
        HomeTabs.category => CategoriesList(fromOtherPage: false),
      },
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: state.currentTab.index,
        onTap: (val) {
          final currentTab = HomeTabs.values.elementAt(val);
          switch (currentTab) {
            case HomeTabs.dashboard:
              transactionProvider.filterDashboard();
              break;
            case HomeTabs.transaction:
              transactionProvider.getTransactions();
              break;
            case HomeTabs.category:
              categoryProvider.getCategories();
              break;
          }
          provider.updateBottomNavigationBarIndex(currentTab);
        },
      ),
    );
  }
}
