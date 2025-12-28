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
import 'package:fluttertoast/fluttertoast.dart';

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
      if (next.eTransactionState == ETransactionState.success) {
        if (budgetState.budget != null) {
          budgetProvider.updateBudgetFromCreateTransaction(
            budgetState.budget!.copyWith(
              totalExpense:
                  state.selectedTransactionType == TransactionType.expense
                  ? ((budgetState.budget?.totalExpense ?? 0) +
                        double.parse(provider.amountController.text.trim()))
                  : budgetState.budget?.totalExpense,
              budgetAmount:
                  state.selectedTransactionType == TransactionType.income &&
                      state.isIncomeAddInBudget
                  ? ((budgetState.budget?.budgetAmount ?? 0) +
                        double.parse(provider.amountController.text.trim()))
                  : budgetState.budget?.budgetAmount,
            ),
          );
        }
      } else {
        Listeners.transactionListener(
          context: context,
          state: next,
          provider: provider,
        );
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if ((state.eTransactionState == ETransactionState.ready) &&
          (provider.arguementTransaction != null)) {
        provider.updateValuesFromEditTransaction();
        if (provider.arguementTransaction?.categoryId != null) {
          categoryProvider.getCategory(
            provider.arguementTransaction!.categoryId!,
          );
        }
        if (provider.arguementTransaction?.budgetId != null) {
          budgetProvider.getBudget(
            provider.arguementTransaction!.budgetId!,
          );
        }
      }
    });
    final bool isEditTransaction = provider.arguementTransaction != null;
    final bool isSubmitting =
        ((state.eTransactionState == ETransactionState.loading) ||
        (budgetState.eState == EState.updatingBudgetForTransaction));
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: isEditTransaction ? "Edit Transaction" : "Add Transaction",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Form(
          key: provider.formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
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
                    SizedBox(height: 16),
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
                          initialDate: currentDate,
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
                    SizedBox(height: 16),
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
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
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
                padding:  EdgeInsets.symmetric(vertical: 12),
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
  }) {
    return Column(
      children: [
        SizedBox(height: 16),
        CustomTextFormField(
          labelText: 'Category',
          hintText: 'Select Category',
          isMandatoryField: true,
          controller: categoryProvider.filterSelectedCategoryController,
          enabled: !isSubmitting && categoryState.eState != EState.loading,
          validator: (value) {
            if (((value == null) || (value.isEmpty))) {
              return 'Please select your transaction category type.';
            }
            return null;
          },
          readOnly: true,
          suffix: categoryState.eState == EState.loading
              ? Padding(
                  padding: EdgeInsets.all(12),
                  child: const CircularProgressIndicator(color: Colors.amber),
                )
              : null,
          onTap: (!isSubmitting && categoryState.eState != EState.loading)
              ? () async {
                  Navigator.push(
                    context,
                    CategoryListPage.route(fromOtherPage: true),
                  ).then((selectedCategory) {
                    if (((selectedCategory != null) &&
                        (selectedCategory is CategoryModel))) {
                      categoryProvider.updateSelectedCategory(selectedCategory);
                      provider.selectTransactionCategory(selectedCategory.id);
                    }
                  });
                }
              : null,
        ),
        SizedBox(height: 16),
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
                            (result is bool) &&
                            (result == true))) {
                          categoryProvider.getCategories();
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
          isMandatoryField: true,
          controller: budgetProvider.nameController,
          enabled: !isSubmitting && budgetState.eState != EState.loading,
          validator: (value) {
            if (((value == null) || (value.isEmpty))) {
              return 'Please select your budget.';
            }
            return null;
          },
          readOnly: true,
          suffix: budgetState.eState == EState.loading
              ? Padding(
                  padding: EdgeInsets.all(12),
                  child: const CircularProgressIndicator(color: Colors.amber),
                )
              : null,
          onTap: (!isSubmitting && budgetState.eState != EState.loading)
              ? () async {
                  Navigator.push(
                    context,
                    BudgetListPage.route(fromOtherPage: true),
                  ).then((selectedBudget) {
                    if (((selectedBudget != null) &&
                        (selectedBudget is BudgetModel))) {
                      budgetProvider.updateSelectedBudget(selectedBudget);
                      provider.selectTransactionBudget(selectedBudget.id!);
                    }
                  });
                }
              : null,
        ),
        SizedBox(height: 16),
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
                            (result is bool) &&
                            (result == true))) {
                          budgetProvider.getBudgetList();
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
              SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: state.isIncomeAddInBudget,
                    onChanged: isSubmitting
                        ? null
                        : (value) {
                            if (budgetState.budget?.budgetAmount != null) {
                              provider.updateBudgetCheck(value ?? false);
                            } else {
                              Fluttertoast.showToast(
                                msg: "Please select the budget details first!",
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                              );
                              Navigator.push(
                                context,
                                CreateBudgetPage.route(
                                  fromOtherPage: true,
                                  budget: budgetState.budget,
                                ),
                              ).whenComplete(() {
                                budgetProvider.getBudget(
                                  budgetState.budget!.id!,
                                );
                              });
                            }
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
