import 'package:finance_tracking/components/custom_app_bar.dart';
import 'package:finance_tracking/components/custom_button.dart';
import 'package:finance_tracking/components/custom_text_form_field.dart';
import 'package:finance_tracking/models/category_model/category_model.dart';
import 'package:finance_tracking/providers/category/category_provider.dart';
import 'package:finance_tracking/providers/category/category_state.dart';
import 'package:finance_tracking/utils/listeners.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateCategoryBody extends ConsumerWidget {
  const CreateCategoryBody({
    super.key,
    required this.fromOtherPage,
    this.categoryModel,
  });

  final bool fromOtherPage;
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
        fromOtherPage: fromOtherPage,
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
                    labelText: 'Budget Start Date',
                    hintText: 'dd/mm/yyyy',
                    validator: (value) {
                      if (state.showBudgetFields &&
                          (value == null || value.isEmpty)) {
                        return 'Please select your Budget Start Date.';
                      }
                      return null;
                    },
                    controller: provider.categoryStartDateController,
                    enabled: (state.eCategoryState != ECategoryState.loading),
                    isMandatoryField: state.showBudgetFields,
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
                  SizedBox(height: 16),
                  CustomTextFormField(
                    labelText: 'Budget End Date',
                    isMandatoryField: state.showBudgetFields,
                    hintText: 'dd/mm/yyyy',
                    enabled:
                        (((state.startDate != null) &&
                            (state.eCategoryState != ECategoryState.loading))),
                    controller: provider.categoryEndDateController,
                    validator: (value) {
                      if (state.showBudgetFields && value == null) {
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
