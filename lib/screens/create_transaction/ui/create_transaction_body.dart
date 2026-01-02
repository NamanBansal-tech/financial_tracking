import 'package:finance_tracking/components/custom_app_bar.dart';
import 'package:finance_tracking/components/custom_button.dart';
import 'package:finance_tracking/components/custom_drop_down_button.dart';
import 'package:finance_tracking/components/custom_text_form_field.dart';
import 'package:finance_tracking/models/budget_model/budget_model.dart';
import 'package:finance_tracking/models/category_model/category_model.dart';
import 'package:finance_tracking/models/transaction_model/transaction_model.dart';
import 'package:finance_tracking/providers/budget/budget_provider.dart';
import 'package:finance_tracking/providers/budget/budget_state.dart';
import 'package:finance_tracking/providers/category/category_provider.dart';
import 'package:finance_tracking/providers/category/category_state.dart';
import 'package:finance_tracking/providers/transaction/transaction_provider.dart';
import 'package:finance_tracking/providers/transaction/transaction_state.dart';
import 'package:finance_tracking/screens/budget_list/budget_list_page.dart';
import 'package:finance_tracking/screens/category_list/category_list_page.dart';
import 'package:finance_tracking/screens/create_budget/create_budget_page.dart';
import 'package:finance_tracking/screens/create_category/create_category_page.dart';
import 'package:finance_tracking/utils/listeners.dart';
import 'package:finance_tracking/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateTransactionBody extends ConsumerWidget {
  const CreateTransactionBody({super.key, this.transactionModel});

  final TransactionModel? transactionModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryRef = categoryProviderProvider(widgetRef: ref);
    final categoryProvider = ref.read(categoryRef.notifier);
    final categoryState = ref.watch(categoryRef);
    final budgetRef = budgetProviderProvider(widgetRef: ref);
    final budgetProvider = ref.read(budgetRef.notifier);
    final budgetState = ref.watch(budgetRef);
    final transactionRef = transactionProviderProvider(
      widgetRef: ref,
      transaction: transactionModel,
    );
    final state = ref.watch(transactionRef);
    final provider = ref.read(transactionRef.notifier);
    ref.listen<CategoryState>(categoryRef, (_, next) {
      Listeners.categoryListener(
        context: context,
        state: next,
        provider: categoryProvider,
        fromOtherPage: false,
      );
    });
    ref.listen<BudgetState>(budgetRef, (_, next) {
      Listeners.budgetListener(
        context: context,
        state: next,
        provider: budgetProvider,
        fromOtherPage: false,
      );
    });
    ref.listen<TransactionState>((transactionRef), (_, next) {
      if (next.eState == EState.success) {
        if (budgetState.budget != null) {
          num? expense = budgetState.budget?.totalExpense ?? 0;
          num budget = (budgetState.budget?.budgetAmount ?? 0);
          if ((next.selectedTransactionType == TransactionType.expense)) {
            if ((transactionModel?.isIncomeAddedInBudget == 1)) {
              budget -= double.parse(provider.amountController.text.trim());
            }
            expense += double.parse(provider.amountController.text.trim());
          }
          if ((next.selectedTransactionType == TransactionType.income)) {
            if ((next.isIncomeAddInBudget)) {
              budget += double.parse(provider.amountController.text.trim());
            } else {
              budget -= double.parse(provider.amountController.text.trim());
            }
          }
          budgetProvider.updateBudgetFromCreateTransaction(
            budgetState.budget!.copyWith(
              totalExpense: expense,
              budgetAmount: budget,
            ),
          );
          return;
        }
        Listeners.transactionListener(
          context: context,
          state: next,
          provider: provider,
        );
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if ((state.eState == EState.ready) &&
          (provider.arguementTransaction != null)) {
        provider.updateValuesFromEditTransaction();
        if (provider.arguementTransaction?.categoryId != null) {
          categoryProvider.getCategory(
            provider.arguementTransaction!.categoryId!,
          );
        }
        if (provider.arguementTransaction?.budgetId != null) {
          budgetProvider.getBudget(provider.arguementTransaction!.budgetId!);
        }
      }
    });
    final bool isEditTransaction = provider.arguementTransaction != null;
    final bool isSubmitting =
        ((state.eState == EState.loading) ||
        (budgetState.eState == EState.updatingBudgetForTransaction));
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: isEditTransaction ? "Edit Transaction" : "Add Transaction",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Form(
          key: provider.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      hintText: 'Transaction Name',
                      enabled: !isSubmitting,
                      controller: provider.nameController,
                      isMandatoryField: true,
                      labelText: 'Name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your transaction name.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      labelText: 'Date',
                      enabled: !isSubmitting,
                      isMandatoryField: true,
                      controller: provider.dateController,
                      hintText: 'dd-mm-yyyy',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select your transaction date.';
                        }
                        return null;
                      },
                      onTap: () async {
                        final currentDate = DateTime.now();
                        final result = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          lastDate: currentDate,
                          initialDate: state.selectedDate,
                          currentDate: currentDate,
                          helpText: 'Select Transaction Date',
                        );
                        if (result != null) {
                          provider.selectTransactionDate(result);
                        }
                      },
                      readOnly: true,
                      suffix: Icon(Icons.calendar_month_rounded),
                    ),
                    SizedBox(height: 16.h),
                    CustomTextFormField(
                      labelText: 'Amount',
                      enabled: !isSubmitting,
                      controller: provider.amountController,
                      isMandatoryField: true,
                      hintText: 'Enter the amount',
                      digitsOnly: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your transaction amount.';
                        }
                        if ((num.tryParse(value) == 0)) {
                          return 'Amount should be greater than 0.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    CustomDropDownButton(
                      initialValue: state.selectedTransactionType,
                      enabled: !isSubmitting,
                      validator: (value) {
                        if (value == null) {
                          return 'Please select your transaction type.';
                        }
                        return null;
                      },
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
                    ),
                    categoryWidget(
                      context: context,
                      categoryProvider: categoryProvider,
                      categoryState: categoryState,
                      provider: provider,
                      isSubmitting: isSubmitting,
                      state: state,
                    ),
                    budgetWidget(
                      context: context,
                      budgetProvider: budgetProvider,
                      budgetState: budgetState,
                      provider: provider,
                      state: state,
                      isSubmitting: isSubmitting,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: CustomButton(
                  label: 'Submit',
                  onTap: () {
                    if (isEditTransaction) {
                      provider.editTransaction();
                    } else {
                      provider.createTransaction();
                    }
                  },
                  isLoading: isSubmitting,
                  isExpanded: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryWidget({
    required BuildContext context,
    required CategoryProvider categoryProvider,
    required CategoryState categoryState,
    required TransactionProvider provider,
    required bool isSubmitting,
    required TransactionState state,
  }) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        CustomTextFormField(
          labelText: 'Category',
          hintText: 'Select Category',
          controller: categoryProvider.filterSelectedCategoryController,
          enabled:
              ((!isSubmitting) && (categoryState.eState != EState.loading)),
          readOnly: true,
          suffix: (categoryState.eState == EState.loading)
              ? Padding(
                  padding: EdgeInsets.all(12.w),
                  child: const CircularProgressIndicator(),
                )
              : (state.selectedCategoryId != null)
              ? GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    categoryProvider.updateSelectedCategory(null);
                    provider.updateCategoryId(null);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Icon(Icons.close_rounded),
                  ),
                )
              : null,
          onTap: ((!isSubmitting) && (categoryState.eState != EState.loading))
              ? () async {
                  Navigator.push(
                    context,
                    CategoryListPage.route(fromOtherPage: true),
                  ).then((selectedCategory) {
                    if (((selectedCategory != null) &&
                        (selectedCategory is CategoryModel))) {
                      categoryProvider.updateSelectedCategory(selectedCategory);
                      provider.updateCategoryId(selectedCategory.id);
                    }
                  });
                }
              : null,
        ),
        SizedBox(height: 16.h),
        RichText(
          text: TextSpan(
            text:
                'Category is not listed in the above list. You can add from here!',
            style: TextStyle(color: Colors.black),
            children: [
              WidgetSpan(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () async {
                      if (!isSubmitting) {
                        final result = await Navigator.push(
                          context,
                          CreateCategoryPage.route(fromOtherPage: true),
                        );
                        if (((context.mounted) &&
                            (result is int?) &&
                            (result != null))) {
                          provider.updateCategoryId(result);
                          categoryProvider.getCategory(result);
                        }
                      }
                    },
                    child: Text('Add New Category', textAlign: TextAlign.end),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget budgetWidget({
    required BuildContext context,
    required BudgetProvider budgetProvider,
    required BudgetState budgetState,
    required TransactionProvider provider,
    required TransactionState state,
    required bool isSubmitting,
  }) {
    return Column(
      children: [
        CustomTextFormField(
          labelText: 'Budget',
          hintText: 'Select Budget',
          controller: budgetProvider.nameController,
          enabled: !isSubmitting && budgetState.eState != EState.loading,
          readOnly: true,
          suffix: budgetState.eState == EState.loading
              ? Padding(
                  padding: EdgeInsets.all(12.w),
                  child: const CircularProgressIndicator(),
                )
              : (state.selectedBudgetId != null)
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
          onTap: ((!isSubmitting) && (budgetState.eState != EState.loading))
              ? () async {
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
                }
              : null,
        ),
        SizedBox(height: 16.h),
        RichText(
          text: TextSpan(
            text:
                'Budget is not listed in the above list. You can add from here!',
            style: TextStyle(color: Colors.black),
            children: [
              WidgetSpan(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () async {
                      if (!isSubmitting) {
                        final result = await Navigator.push(
                          context,
                          CreateBudgetPage.route(fromOtherPage: true),
                        );
                        if (((context.mounted) &&
                            (result is int?) &&
                            (result != null))) {
                          budgetProvider.getBudget(result);
                          provider.updateBudgetId(result);
                        }
                      }
                    },
                    child: Text('Add New Budget', textAlign: TextAlign.end),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (((state.selectedTransactionType == TransactionType.income) &&
            (budgetState.budget != null))) ...[
          Column(
            children: [
              SizedBox(height: 16.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: state.isIncomeAddInBudget,
                    onChanged: isSubmitting
                        ? null
                        : (value) {
                            provider.updateBudgetCheck(value ?? false);
                          },
                  ),
                  Flexible(
                    child: Text(
                      "Do you want to add this transaction amount in your budget of this budget?",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ],
    );
  }
}
