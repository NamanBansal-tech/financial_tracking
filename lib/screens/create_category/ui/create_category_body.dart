import 'package:finance_tracking/components/custom_app_bar.dart';
import 'package:finance_tracking/components/custom_button.dart';
import 'package:finance_tracking/components/custom_drop_down_button.dart';
import 'package:finance_tracking/components/custom_text_form_field.dart';
import 'package:finance_tracking/models/category_model/category_model.dart';
import 'package:finance_tracking/providers/category/category_provider.dart';
import 'package:finance_tracking/providers/category/category_state.dart';
import 'package:finance_tracking/utils/listeners.dart';
import 'package:finance_tracking/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateCategoryBody extends ConsumerWidget {
  const CreateCategoryBody({
    super.key,
    required this.fromCreateTransactionsPage,
    this.categoryModel,
  });

  final bool fromCreateTransactionsPage;
  final CategoryModel? categoryModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryProvider = categoryProviderProvider(
      widgetRef: ref,
      category: categoryModel,
    );
    final state = ref.watch(categoryProvider);
    final provider = ref.watch(categoryProvider.notifier);
    ref.listen<CategoryState>(
      (categoryProvider),
      (_, next) => Listeners.categoryListener(
        context: context,
        state: next,
        provider: provider,
        popTillDashboard: state.category == null,
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if ((state.eCategoryState == ECategoryState.ready) &&
          (categoryModel != null)) {
        provider.updateValuesForEditCategory();
      }
    });
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(title: "Add Category"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Form(
          key: provider.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField(
                  hintText: 'Category Name',
                  isMandatoryField: true,
                  enabled: state.eCategoryState != ECategoryState.loading,
                  controller: provider.categoryNameController,
                  labelText: 'Category Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your category name.';
                    }
                    return null;
                  },
                ),
                if (state.showBudgetFields) ...[
                  SizedBox(height: 16),
                  CustomTextFormField(
                    labelText: 'Budget',
                    isMandatoryField: state.showBudgetFields,
                    enabled: state.eCategoryState != ECategoryState.loading,
                    controller: provider.categoryBudgetController,
                    hintText: 'Enter the budget',
                    digitsOnly: true,
                    validator: (value) {
                      if (state.showBudgetFields &&
                          (value == null || value.isEmpty)) {
                        return 'Please enter your budget for this category.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    labelText: 'Budget Duration',
                    isMandatoryField: state.showBudgetFields,
                    enabled: state.eCategoryState != ECategoryState.loading,
                    controller: provider.categoryBudgetDurationController,
                    hintText: 'Enter the budget duration',
                    digitsOnly: true,
                    validator: (value) {
                      if (state.showBudgetFields &&
                          (value == null || value.isEmpty)) {
                        return 'Please enter your budget duration for this category.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  CustomDropDownButton(
                    selectedValue: state.selectedBudgetPeriod,
                    isMandatoryField: state.showBudgetFields,
                    enabled: state.eCategoryState != ECategoryState.loading,
                    validator: (value) {
                      if (state.showBudgetFields && value == null) {
                        return 'Please select your budget period.';
                      }
                      return null;
                    },
                    items:
                        BudgetPeriods.values
                            .map(
                              (e) => DropdownMenuItem(
                                onTap: () {
                                  provider.updateBudgetPeriod(e);
                                },
                                value: e,
                                child: Text(
                                  Utility.getDisplayNameforBudgetPeriod(
                                    e.index,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                    labelText: 'Budget Period',
                    hintText: 'Select Budget Period',
                  ),
                ],
                SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Checkbox(
                          value: state.showBudgetFields,
                          onChanged: (val) {
                            provider.updateShowBudgetFields(val);
                          },
                        ),
                        alignment: PlaceholderAlignment.middle,
                      ),
                      TextSpan(
                        text:
                            "Do you want to set the budget for this category?",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                CustomButton(
                  onTap: () {
                    if (state.category != null) {
                      provider.editCategory();
                    } else {
                      provider.createCategory();
                    }
                  },
                  label: 'Submit',
                  isExpanded: true,
                  isLoading: state.eCategoryState == ECategoryState.loading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
