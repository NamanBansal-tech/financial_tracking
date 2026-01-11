import 'package:finance_tracking/components/custom_button.dart';
import 'package:finance_tracking/components/custom_drop_down_button.dart';
import 'package:finance_tracking/components/custom_text_form_field.dart';
import 'package:finance_tracking/models/budget_model/budget_model.dart';
import 'package:finance_tracking/models/category_model/category_model.dart';
import 'package:finance_tracking/models/transaction_model/transaction_model.dart';
import 'package:finance_tracking/providers/budget/budget_provider.dart';
import 'package:finance_tracking/providers/category/category_provider.dart';
import 'package:finance_tracking/providers/transaction/transaction_provider.dart';
import 'package:finance_tracking/providers/transaction/transaction_state.dart';
import 'package:finance_tracking/screens/budget_list/budget_list_page.dart';
import 'package:finance_tracking/screens/category_list/category_list_page.dart';
import 'package:finance_tracking/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionsFilter extends ConsumerWidget {
  const TransactionsFilter({
    super.key,
    required this.transactionRef,
    required this.categoryRef,
    required this.budgetRef,
  });
  final TransactionProviderProvider transactionRef;
  final CategoryProviderProvider categoryRef;
  final BudgetProviderProvider budgetRef;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(transactionRef);
    final provider = ref.read(transactionRef.notifier);
    final budgetProvider = ref.read(budgetRef.notifier);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Filter Transactions',
            style: TextStyle(fontSize: 20.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          CustomTextFormField(
            labelText: 'Name',
            hintText: 'Transaction Name',
            controller: provider.nameController,
          ),
          SizedBox(height: 10.h),
          CustomTextFormField(
            labelText: 'Date',
            hintText: 'dd/mm/yyyy',
            controller: provider.dateController,
            onTap: () {
              final currentDate = DateTime.now();
              showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                lastDate: currentDate,
                initialDate: currentDate,
                currentDate: currentDate,
                helpText: 'Select Transaction Date',
              ).then((value) {
                if (value != null) {
                  provider.selectTransactionDate(value);
                }
              });
            },
            readOnly: true,
            suffix: Icon(Icons.calendar_month_rounded),
          ),
          SizedBox(height: 10.h),
          CustomTextFormField(
            labelText: 'Amount',
            hintText: 'Enter the amount',
            controller: provider.amountController,
            digitsOnly: true,
          ),
          SizedBox(height: 10.h),
          CustomDropDownButton(
            initialValue: state.selectedTransactionType,
            items: TransactionType.values.map((e) {
              return DropdownMenuItem(
                onTap: () {
                  provider.selectTransactionType(e);
                },
                value: e,
                child: Text(Utility.makeFirstLetterCapital(e.name)),
              );
            }).toList(),
            labelText: 'Transaction Type',
            isMandatoryField: true,
            hintText: 'Select Transaction Type',
            suffix: (state.selectedTransactionType != null)
                ? IconButton(
                    onPressed: () {
                      provider.selectTransactionType(null);
                    },
                    icon: Icon(Icons.close_rounded, color: Colors.amber),
                  )
                : null,
          ),
          SizedBox(height: 10.h),
          CustomTextFormField(
            labelText: 'Category',
            hintText: 'Select Category',
            controller: ref.watch(categoryRef.notifier).filterSelectedCategoryController,
            readOnly: true,
            suffix: (state.selectedCategoryId != null)
                ? GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      provider.updateCategoryId(null);
                      ref.read(categoryRef.notifier).updateSelectedCategory(null);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Icon(Icons.close_rounded),
                    ),
                  )
                : null,
            onTap: () async {
              Navigator.push(
                context,
                CategoryListPage.route(fromOtherPage: true),
              ).then((selectedCategory) {
                if (selectedCategory is CategoryModel) {
                  ref.read(categoryRef.notifier).updateSelectedCategory(selectedCategory);
                  provider.updateCategoryId(selectedCategory.id);
                }
              });
            },
          ),
          SizedBox(height: 10.h),
          CustomTextFormField(
            labelText: 'Budget',
            hintText: 'Select Budget',
            controller: budgetProvider.nameController,
            readOnly: true,
            suffix: (state.selectedBudgetId != null)
                ? GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      budgetProvider.updateSelectedBudget(null);
                      provider.updateBudgetId(null);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Icon(Icons.close_rounded),
                    ),
                  )
                : null,
            onTap: () async {
              Navigator.push(
                context,
                BudgetListPage.route(fromOtherPage: true),
              ).then((selectedBudget) {
                if (((selectedBudget != null) &&
                    (selectedBudget is BudgetModel))) {
                  budgetProvider.updateSelectedBudget(selectedBudget);
                  provider.updateBudgetId(selectedBudget.id!);
                }
              });
            },
          ),
          SizedBox(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: CustomButton(
                  label: 'Search',
                  onTap: () {
                    Navigator.pop(context, ESearchType.filter);
                  },
                  isExpanded: true,
                ),
              ),

              SizedBox(width: 20.w),
              Expanded(
                child: CustomButton(
                  label: 'Reset',
                  onTap: () {
                    Navigator.pop(context, ESearchType.reset);
                  },
                  isExpanded: true,
                  isSecondary: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
