import 'package:finance_tracking/components/custom_app_bar.dart';
import 'package:finance_tracking/components/custom_button.dart';
import 'package:finance_tracking/components/custom_text_form_field.dart';
import 'package:finance_tracking/models/budget_model/budget_model.dart';
import 'package:finance_tracking/providers/budget/budget_provider.dart';
import 'package:finance_tracking/providers/budget/budget_state.dart';
import 'package:finance_tracking/providers/category/category_state.dart';
import 'package:finance_tracking/utils/listeners.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateBudgetBody extends ConsumerWidget {
  const CreateBudgetBody({super.key, required this.fromOtherPage, this.budget});

  final bool fromOtherPage;
  final BudgetModel? budget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final budgetProvider = budgetProviderProvider(
      widgetRef: ref,
      budget: budget,
    );
    final state = ref.watch(budgetProvider);
    final provider = ref.read(budgetProvider.notifier);
    ref.listen<BudgetState>(
      (budgetProvider),
      (_, next) => Listeners.budgetListener(
        context: context,
        state: next,
        provider: provider,
        fromOtherPage: fromOtherPage,
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if ((state.eState == EState.ready) && (budget != null)) {
        provider.updateValuesForEditBudget();
      }
    });
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(title: "Add Budget"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Form(
          key: provider.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.h),
                CustomTextFormField(
                  hintText: 'Budget Name',
                  isMandatoryField: true,
                  enabled: state.eState != EState.loading,
                  controller: provider.nameController,
                  labelText: 'Budget Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your budget name.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                CustomTextFormField(
                  labelText: 'Budget',
                  isMandatoryField: true,
                  enabled: state.eState != EState.loading,
                  controller: provider.amountController,
                  hintText: 'Enter the budget',
                  digitsOnly: true,
                  validator: (value) {
                    if ((value == null || value.isEmpty)) {
                      return 'Please enter your budget.';
                    }
                    if ((num.tryParse(value) == 0)) {
                      return 'Budget should be greater than 0.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                CustomTextFormField(
                  labelText: 'Budget Start Date',
                  hintText: 'dd/mm/yyyy',
                  validator: (value) {
                    if ((value == null || value.isEmpty)) {
                      return 'Please select your Budget Start Date.';
                    }
                    return null;
                  },
                  controller: provider.startDateController,
                  enabled: (state.eState != EState.loading),
                  isMandatoryField: true,
                  onTap: () {
                    final currentDate = DateTime.now();
                    showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      lastDate: currentDate.copyWith(
                        year: currentDate.year + 1,
                      ),
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
                SizedBox(height: 16.h),
                CustomTextFormField(
                  labelText: 'Budget End Date',
                  isMandatoryField: true,
                  hintText: 'dd/mm/yyyy',
                  enabled:
                      (((state.startDate != null) &&
                      (state.eState != EState.loading))),
                  controller: provider.endDateController,
                  validator: (value) {
                    if (value == null) {
                      return 'Please select your Budget End Date.';
                    }
                    return null;
                  },
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
                      lastDate: currentDate.copyWith(
                        year: currentDate.year + 1,
                      ),
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
                SizedBox(height: 30.h),
                CustomButton(
                  onTap: () {
                    if (state.budget != null) {
                      provider.editBudget();
                    } else {
                      provider.createBudget();
                    }
                  },
                  label: 'Submit',
                  isExpanded: true,
                  isLoading: state.eState == EState.loading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
