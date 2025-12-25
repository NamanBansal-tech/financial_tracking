import 'package:finance_tracking/components/custom_button.dart';
import 'package:finance_tracking/components/custom_text_form_field.dart';
import 'package:finance_tracking/providers/category/category_provider.dart';
import 'package:finance_tracking/providers/transaction/transaction_provider.dart';
import 'package:finance_tracking/screens/categorie_list/category_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DashboardFilter extends ConsumerWidget {
  const DashboardFilter({
    super.key,
    required this.transactionRef,
    required this.categoryRef,
  });

  final TransactionProviderProvider transactionRef;
  final CategoryProviderProvider categoryRef;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionProvider = ref.watch(transactionRef.notifier);
    final categoryProvider = ref.watch(categoryRef.notifier);
    final transactionState = ref.watch(transactionRef);

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            labelText: 'From Date of Transaction',
            hintText: 'dd/mm/yyyy',
            controller: transactionProvider.fromLineChartDateController,
            onTap: () async {
              final currentDate = DateTime.now();
              final pickedDate = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                lastDate: currentDate,
                initialDate: transactionState.fromLineChartDate,
                currentDate: currentDate,
                helpText: 'Select Transaction Date',
              );
              if (pickedDate != null) {
                transactionProvider.selectfromLineTransactionDate(pickedDate);
              }
            },
            readOnly: true,
            suffix: Icon(Icons.calendar_month_rounded),
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            labelText: 'To Date of Transaction',
            hintText: 'dd/mm/yyyy',
            controller: transactionProvider.toLineChartDateController,
            onTap: () async {
              final currentDate = DateTime.now();
              final pickedDate = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                lastDate: DateTime(3000),
                initialDate: transactionState.toLineChartDate,
                currentDate: currentDate,
                helpText: 'Select Transaction Date',
              );
              if (pickedDate != null) {
                transactionProvider.selecttoLineTransactionDate(pickedDate);
              }
            },
            readOnly: true,
            suffix: Icon(Icons.calendar_month_rounded),
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            labelText: 'Select Calender Month',
            hintText: 'dd/mm/yyyy',
            controller: transactionProvider.calenderMonthController,
            onTap: () async {
              final currentDate = DateTime.now();
              final pickedDate = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                lastDate: DateTime(3000),
                // lastDate: currentDate,
                initialDate: transactionState.selectedCalenderMonth,
                currentDate: currentDate,
                helpText: 'Select Transaction Date',
              );
              if (pickedDate != null) {
                transactionProvider.selectCalenderMonth(pickedDate);
              }
            },
            readOnly: true,
            suffix: Icon(Icons.calendar_month_rounded),
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            labelText: 'Category',
            hintText: 'Select Category',
            controller: categoryProvider.filterSelectedCategoryController,
            readOnly: true,
            onTap: () async {
              final selectedCategory = await Navigator.push(
                context,
                CategoryListPage.route(
                  fromDashboard: true,
                ),
              );
              if (selectedCategory != null) {
                categoryProvider.updateSelectedCategory(selectedCategory);
              }
            },
          ),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: CustomButton(
                  onTap: () {
                    if ((transactionState.fromLineChartDate != null) &&
                        (transactionState.toLineChartDate != null) &&
                        (transactionState.toLineChartDate!.compareTo(
                              transactionState.fromLineChartDate!,
                            ) >=
                            0)) {
                      Navigator.pop(context);
                      transactionProvider.filterDashboard();
                    } else {
                      Fluttertoast.showToast(
                        msg: "To Date can not be less than from Date",
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                      );
                    }
                  },
                  label: 'Search',
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: CustomButton(
                  onTap: () {
                    Navigator.pop(context);
                    transactionProvider.resetDashboardWidgets();
                    categoryProvider.resetWidgets();
                    transactionProvider.filterDashboard();
                  },
                  label: 'Reset',
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
