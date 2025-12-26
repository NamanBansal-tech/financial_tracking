import 'package:finance_tracking/components/custom_app_bar.dart';
import 'package:finance_tracking/components/custom_button.dart';
import 'package:finance_tracking/components/custom_drop_down_button.dart';
import 'package:finance_tracking/components/custom_text_form_field.dart';
import 'package:finance_tracking/models/transaction_model/transaction_model.dart';
import 'package:finance_tracking/providers/category/category_provider.dart';
import 'package:finance_tracking/providers/category/category_state.dart';
import 'package:finance_tracking/providers/transaction/transaction_provider.dart';
import 'package:finance_tracking/providers/transaction/transaction_state.dart';
import 'package:finance_tracking/screens/categorie_list/category_list_page.dart';
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
    final categoryProviderTemp = categoryProviderProvider(
      widgetRef: ref,
    );
    final categoryProvider = ref.watch(categoryProviderTemp.notifier);
    final categoryState = ref.watch(categoryProviderTemp);
    final transactionProvider = transactionProviderProvider(
      widgetRef: ref,
      transaction: transactionModel,
    );
    final state = ref.watch(transactionProvider);
    final provider = ref.watch(transactionProvider.notifier);
    ref.listen<CategoryState>(categoryProviderTemp, (_, next) {
      Listeners.categoryListener(
        context: context,
        state: next,
        provider: categoryProvider,
        fromOtherPage: false,
      );
    });
    ref.listen<TransactionState>((transactionProvider), (_, next) {
      if (next.eTransactionState == ETransactionState.success) {
        if (categoryState.category != null) {
          categoryProvider.updateCategoryFromCreateTransaction(
            categoryState.category!.copyWith(
              totalExpense:
                  state.selectedTransactionType == TransactionType.expense
                      ? ((categoryState.category?.totalExpense ?? 0) +
                          double.parse(
                            provider.transactionAmountController.text.trim(),
                          ))
                      : categoryState.category?.totalExpense,
              budgetAmount:
                  state.selectedTransactionType == TransactionType.income && state.isIncomeAddInBudget
                      ? ((categoryState.category?.budgetAmount ?? 0) +
                          double.parse(
                            provider.transactionAmountController.text.trim(),
                          ))
                      : categoryState.category?.budgetAmount,
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
      }
    });
    final bool isEditTransaction = provider.arguementTransaction != null;
    final bool isSubmitting =
        state.eTransactionState == ETransactionState.loading ||
        categoryState.eCategoryState ==
            ECategoryState.updatingCategoryForTransaction;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: isEditTransaction ? "Edit Transaction" : "Add Transaction",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Form(
          key: provider.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                  hintText: 'Transaction Name',
                  enabled: !isSubmitting,
                  controller: provider.transactionNameController,
                  isMandatoryField: true,
                  labelText: 'Notes',
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
                  controller: provider.transactionDateController,
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
                  controller: provider.transactionAmountController,
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
                  items:
                      TransactionType.values.map((e) {
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
                SizedBox(height: 16),
                CustomTextFormField(
                  labelText: 'Category',
                  hintText: 'Select Category',
                  isMandatoryField: true,
                  controller: categoryProvider.filterSelectedCategoryController,
                  enabled:
                      !isSubmitting &&
                      categoryState.eCategoryState != ECategoryState.loading,
                  validator: (value) {
                    if (value == null) {
                      return 'Please select your transaction category type.';
                    }
                    return null;
                  },
                  readOnly: true,
                  suffix:
                      categoryState.eCategoryState == ECategoryState.loading
                          ? Padding(
                            padding: EdgeInsets.all(12),
                            child: const CircularProgressIndicator(
                              color: Colors.amber,
                            ),
                          )
                          : null,
                  onTap:
                      (!isSubmitting &&
                              categoryState.eCategoryState !=
                                  ECategoryState.loading)
                          ? () async {
                            Navigator.push(
                              context,
                              CategoryListPage.route(fromOtherPage: true),
                            ).then((selectedCategory) {
                              if (selectedCategory != null) {
                                categoryProvider.updateSelectedCategory(
                                  selectedCategory,
                                );
                                provider.selectTransactionCategory(
                                  selectedCategory!.id!,
                                );
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
                                  CreateCategoryPage.route(
                                    fromOtherPage: true,
                                  ),
                                );
                                if (context.mounted &&
                                    result is bool &&
                                    result == true) {
                                  categoryProvider.getCategories();
                                }
                              }
                            },
                            child: Text(
                              'Add New Category',
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (((state.selectedTransactionType ==
                        TransactionType.income) &&
                    (categoryState.category != null)))
                  Column(
                    children: [
                      SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: state.isIncomeAddInBudget,
                            onChanged:
                                isSubmitting
                                    ? null
                                    : (value) {
                                      if (categoryState
                                              .category
                                              ?.budgetAmount !=
                                          null) {
                                        provider.updateBudgetCheck(
                                          value ?? false,
                                        );
                                      } else {
                                        Fluttertoast.showToast(
                                          msg:
                                              "Please select the budget details first!",
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                        );
                                        Navigator.push(
                                          context,
                                          CreateCategoryPage.route(
                                            fromOtherPage: true,
                                            categoryModel:
                                                categoryState.category,
                                          ),
                                        ).whenComplete(() {
                                          categoryProvider.getCategory(categoryState.category!.id!);
                                          provider.updateBudgetCheck(true);
                                        },);
                                      }
                                    },
                          ),
                          Flexible(
                            child: Text(
                              "Do you want to add this transaction amount in your budget of this category?",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                SizedBox(height: 30),
                CustomButton(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
