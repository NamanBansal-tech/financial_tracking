import 'package:finance_tracking/components/custom_app_bar.dart';
import 'package:finance_tracking/components/custom_bottom_sheet.dart';
import 'package:finance_tracking/providers/category/category_state.dart';
import 'package:finance_tracking/providers/common_provider/common_provider.dart';
import 'package:finance_tracking/providers/common_provider/common_state.dart';
import 'package:finance_tracking/screens/home/ui/budget_chart.dart';
import 'package:finance_tracking/screens/home/ui/calender_widget.dart';
import 'package:finance_tracking/screens/home/ui/create_bottom_sheet.dart';
import 'package:finance_tracking/screens/home/ui/dashboard_filter.dart';
import 'package:finance_tracking/screens/home/ui/transactions_line_chart.dart';
import 'package:finance_tracking/utils/extensions.dart';
import 'package:finance_tracking/utils/listeners.dart';
import 'package:finance_tracking/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashBoardPage extends ConsumerWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commonRef = commonProviderProvider(widgetRef: ref);
    final provider = ref.read<CommonProvider>(commonRef.notifier);
    final state = ref.watch<CommonState>(commonRef);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state.eState == EState.ready) {
        provider.updateDashboardValues();
        provider.filterDashboard();
      }
    });
    ref.listen<CommonState>(
      (commonRef),
      (_, next) => Listeners.commonListener(context: context, state: next),
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
                child: DashboardFilter(commonRef: commonRef),
                isDismissible: false,
                enableDrag: false,
              );
            },
            icon: Icon(
              Icons.filter_alt_rounded,
              size: context.height * .03,
            ),
          ),
          IconButton(
            onPressed: () {
              showCreateBottomSheet(context);
            },
            icon: Icon(
              Icons.add,
              size: context.height * .035,
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          if ((state.eState == EState.loading)) ...[
            SizedBox(
              height: context.height / 1.5,
              child: Center(child: CircularProgressIndicator()),
            ),
          ] else ...[
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 12.w),
                children: [
                  Text(
                    "Transactions Summary",
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  TransactionsLineChart(transactions: state.graphTransactions),
                  SizedBox(height: 16.h),
                  if (state.selectedCalenderMonth != null)
                    CalenderWidget(
                      selectedMonth: state.selectedCalenderMonth!,
                      transactions: state.calenderMonthtransactions,
                    ),
                  SizedBox(height: 16.h),
                  if ((state.pieChartData != null))
                    BudgetChart(data: state.pieChartData),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
