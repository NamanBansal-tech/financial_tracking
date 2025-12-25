import 'package:finance_tracking/components/custom_button.dart';
import 'package:finance_tracking/components/custom_drop_down_button.dart';
import 'package:finance_tracking/components/custom_text_form_field.dart';
import 'package:finance_tracking/models/category_model/category_model.dart';
import 'package:finance_tracking/providers/category/category_provider.dart';
import 'package:finance_tracking/providers/transaction/transaction_state.dart';
import 'package:finance_tracking/utils/utility.dart';
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
            labelText: 'Budget Duration',
            controller: provider.categoryBudgetDurationController,
            hintText: 'Enter the budget duration',
            digitsOnly: true,
          ),
          SizedBox(height: 10),
          CustomDropDownButton(
            selectedValue: state.selectedBudgetPeriod,
            isMandatoryField: state.showBudgetFields,
            items:
                BudgetPeriods.values
                    .map(
                      (e) => DropdownMenuItem(
                        onTap: () {
                          provider.updateBudgetPeriod(e);
                        },
                        value: e,
                        child: Text(
                          Utility.getDisplayNameforBudgetPeriod(e.index),
                        ),
                      ),
                    )
                    .toList(),
            labelText: 'Budget Period',
            hintText: 'Select Budget Period',
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
