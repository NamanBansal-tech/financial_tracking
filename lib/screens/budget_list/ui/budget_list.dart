import 'package:finance_tracking/components/common_delete_dialog_box.dart';
import 'package:finance_tracking/components/common_options_bottom_sheet.dart';
import 'package:finance_tracking/components/custom_app_bar.dart';
import 'package:finance_tracking/components/custom_bottom_sheet.dart';
import 'package:finance_tracking/models/budget_model/budget_model.dart';
import 'package:finance_tracking/providers/budget/budget_provider.dart';
import 'package:finance_tracking/providers/budget/budget_state.dart';
import 'package:finance_tracking/providers/category/category_state.dart';
import 'package:finance_tracking/providers/transaction/transaction_state.dart';
import 'package:finance_tracking/screens/budget_list/ui/budget_filter_bottom_sheet.dart';
import 'package:finance_tracking/screens/create_budget/create_budget_page.dart';
import 'package:finance_tracking/screens/transaction_list/transactions_list_page.dart';
import 'package:finance_tracking/utils/app_colors.dart';
import 'package:finance_tracking/utils/extensions.dart';
import 'package:finance_tracking/utils/listeners.dart';
import 'package:finance_tracking/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BudgetList extends ConsumerWidget {
  const BudgetList({super.key, required this.fromOtherPage});

  final bool fromOtherPage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final budgetRef = budgetProviderProvider(widgetRef: ref);
    final state = ref.watch(budgetRef);
    final provider = ref.read(budgetRef.notifier);
    ref.listen<BudgetState>(
      (budgetRef),
      (_, next) => Listeners.budgetListener(
        context: context,
        state: next,
        provider: provider,
        fromOtherPage: fromOtherPage,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state.eState == EState.ready) {
        provider.getBudgetList();
      }
    });
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: "Budget",
        actions: [
          IconButton(
            onPressed: () {
              customBottomSheet(
                context: context,
                child: BudgetFilterBottomSheet(budgetRef: budgetRef),
                isDismissible: false,
                enableDrag: false,
                onSuccess: (value) {
                  if (((value != null) && (value is ESearchType))) {
                    switch (value) {
                      case ESearchType.filter:
                        provider.getBudgetList();
                        break;
                      case ESearchType.reset:
                        provider.resetWidgets();
                        provider.getBudgetList();
                        break;
                    }
                  }
                },
              );
            },
            icon: Icon(Icons.filter_alt_rounded, size: context.height * .03),
          ),
          if (!(fromOtherPage))
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CreateBudgetPage.route(fromOtherPage: false),
                );
              },
              icon: Icon(Icons.add, size: context.height * .035),
            ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 12.w),
        children: [
          state.eState == EState.loading || state.eState == EState.ready
              ? SizedBox(
                  height: context.height / 1.5,
                  child: Center(child: CircularProgressIndicator()),
                )
              : state.budgetList.isEmpty
              ? SizedBox(
                  height: context.height / 1.5,
                  child: Center(child: Text('No budget found.')),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.budgetList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = state.budgetList[index];
                    return customBudgetTile(
                      parentContext: context,
                      budget: item,
                      isDeleting: state.eState == EState.loading,
                      onSuccess: (val) {
                        if (((val != null) && (val is EMoreOptions))) {
                          switch (val) {
                            case EMoreOptions.edit:
                              {
                                provider.getBudgetList();
                                break;
                              }
                            case EMoreOptions.delete:
                              {
                                if ((item.id != null)) {
                                  deleteDialogBox(
                                    context: context,
                                    title:
                                        "Are you sure want to delete the budget '${item.name ?? ""}'?",
                                  ).then((value) {
                                    if ((value == true)) {
                                      provider.deleteBudget(item.id!);
                                    }
                                  });
                                }
                                break;
                              }
                            case EMoreOptions.select:
                              {
                                Navigator.pop(context, item);
                                break;
                              }
                            case EMoreOptions.viewTransactions:
                              {
                                Navigator.push(
                                  context,
                                  TransactionsListPage.route(budgetId: item.id),
                                );
                                break;
                              }
                          }
                        }
                      },
                    );
                  },
                ),
        ],
      ),
    );
  }

  Widget customBudgetTile({
    required BuildContext parentContext,
    required BudgetModel budget,
    required dynamic Function(dynamic) onSuccess,
    required bool isDeleting,
  }) {
    return InkWell(
      onTap: fromOtherPage
          ? () {
              onSuccess(EMoreOptions.select);
            }
          : null,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    budget.name ?? 'N/A',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                Text(
                  '${budget.budgetAmount ?? ''}',
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
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
                    getSubtitle(budget: budget),
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
                        onDelete: () {
                          onSuccess(EMoreOptions.delete);
                        },
                        onEdit: () {
                          Navigator.push(
                            parentContext,
                            CreateBudgetPage.route(
                              fromOtherPage: true,
                              budget: budget,
                            ),
                          ).then((_) {
                            onSuccess(EMoreOptions.edit);
                          });
                        },
                        onView: () {
                          onSuccess(EMoreOptions.viewTransactions);
                        },
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String getSubtitle({required BudgetModel budget}) {
    if (((budget.startDate != null) && (budget.endDate != null))) {
      return "${Utility.getFormattedBudgetDate(budget.startDate)} - ${Utility.getFormattedBudgetDate(budget.endDate)}";
    }
    return "";
  }
}
