import 'package:finance_tracking/components/custom_button.dart';
import 'package:finance_tracking/components/custom_text_form_field.dart';
import 'package:finance_tracking/providers/category/category_provider.dart';
import 'package:finance_tracking/providers/transaction/transaction_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesFilterBottomSheet extends ConsumerWidget {
  const CategoriesFilterBottomSheet({super.key, required this.categoryRef});

  final CategoryProviderProvider categoryRef;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(categoryRef);
    final provider = ref.watch(categoryRef.notifier);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Filter Categories',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'Category Name',
            controller: provider.categoryNameController,
            labelText: 'Category Name',
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            labelText: 'Budget',
            controller: provider.categoryBudgetController,
            hintText: 'Enter the budget',
            digitsOnly: true,
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            labelText: 'Budget Start Date',
            hintText: 'dd/mm/yyyy',
            controller: provider.categoryStartDateController,
            onTap: () {
              final currentDate = DateTime.now();
              showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                lastDate: currentDate.copyWith(year: currentDate.year + 1),
                initialDate: state.startDate,
                currentDate: currentDate,
                helpText: 'Select Budget Start Date',
              ).then((value) {
                if (value != null) {
                  provider.updateBudgetStartDate(value);
                }
              });
            },
            readOnly: true,
            suffix: Icon(Icons.calendar_month_rounded),
          ),
          SizedBox(height: 10),
          CustomTextFormField(
            labelText: 'Budget End Date',
            hintText: 'dd/mm/yyyy',
            enabled: state.startDate != null,
            controller: provider.categoryEndDateController,
            onTap: () {
              final currentDate = DateTime.now();
              DateTime firstDate = DateTime(1900);
              if ((state.startDate != null)) {
                firstDate = state.startDate!.copyWith(
                  day: (state.startDate!.day) + 1,
                );
              }
              showDatePicker(
                context: context,
                firstDate: firstDate,
                lastDate: currentDate.copyWith(year: currentDate.year + 1),
                initialDate: state.endDate,
                currentDate: currentDate,
                helpText: 'Select Budget End Date',
              ).then((value) {
                if (value != null) {
                  provider.updateBudgetEndDate(value);
                }
              });
            },
            readOnly: true,
            suffix: Icon(Icons.calendar_month_rounded),
          ),
          SizedBox(height: 16),
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

              SizedBox(width: 20),
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
