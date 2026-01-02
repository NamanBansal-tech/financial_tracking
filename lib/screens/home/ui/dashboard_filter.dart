import 'package:finance_tracking/components/custom_button.dart';
import 'package:finance_tracking/components/custom_text_form_field.dart';
import 'package:finance_tracking/providers/common_provider/common_provider.dart';
import 'package:finance_tracking/providers/common_provider/common_state.dart';
import 'package:finance_tracking/screens/budget_list/budget_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardFilter extends ConsumerWidget {
  const DashboardFilter({super.key, required this.commonRef});

  final CommonProviderProvider commonRef;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read<CommonProvider>(commonRef.notifier);
    final state = ref.watch<CommonState>(commonRef);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            labelText: 'From Date of Transaction',
            hintText: 'dd/mm/yyyy',
            controller: provider.fromLineChartDateController,
            onTap: () async {
              final currentDate = DateTime.now();
              final pickedDate = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                lastDate: currentDate,
                initialDate: state.fromLineChartDate,
                currentDate: currentDate,
                helpText: 'Select Transaction Date',
              );
              if (pickedDate != null) {
                provider.selectfromLineTransactionDate(pickedDate);
              }
            },
            readOnly: true,
            suffix: Icon(Icons.calendar_month_rounded),
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            labelText: 'To Date of Transaction',
            hintText: 'dd/mm/yyyy',
            enabled: state.fromLineChartDate != null,
            controller: provider.toLineChartDateController,
            onTap: () async {
              final currentDate = DateTime.now();
              DateTime firstDate = DateTime(1900);
              if ((state.fromLineChartDate != null)) {
                firstDate = state.fromLineChartDate!.copyWith(
                  day: (state.fromLineChartDate!.day) + 1,
                );
              }
              final pickedDate = await showDatePicker(
                context: context,
                firstDate: firstDate,
                lastDate: DateTime(3000),
                initialDate: state.toLineChartDate,
                currentDate: currentDate,
                helpText: 'Select Transaction Date',
              );
              if (pickedDate != null) {
                provider.selecttoLineTransactionDate(pickedDate);
              }
            },
            readOnly: true,
            suffix: Icon(Icons.calendar_month_rounded),
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            labelText: 'Select Calender Month',
            hintText: 'dd/mm/yyyy',
            controller: provider.calenderMonthController,
            onTap: () async {
              final currentDate = DateTime.now();
              final pickedDate = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                lastDate: DateTime(3000),
                // lastDate: currentDate,
                initialDate: state.selectedCalenderMonth,
                currentDate: currentDate,
                helpText: 'Select Transaction Date',
              );
              if (pickedDate != null) {
                provider.selectCalenderMonth(pickedDate);
              }
            },
            readOnly: true,
            suffix: Icon(Icons.calendar_month_rounded),
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            labelText: 'Budget',
            hintText: 'Select Budget',
            controller: provider.filterSelectedBudgetController,
            readOnly: true,
            onTap: () async {
              final selectedBudget = await Navigator.push(
                context,
                BudgetListPage.route(fromOtherPage: true),
              );
              if ((selectedBudget != null)) {
                provider.updateSelectedBudget(selectedBudget);
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
                      Navigator.pop(context);
                      provider.filterDashboard();
                  },
                  label: 'Search',
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: CustomButton(
                  onTap: () {
                    Navigator.pop(context);
                    provider.resetDashboardWidgets();
                    provider.filterDashboard();
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
