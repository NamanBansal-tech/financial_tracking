import 'package:finance_tracking/database/database_helper.dart';
import 'package:finance_tracking/database/database_helper_impl.dart';
import 'package:finance_tracking/models/category_model/category_model.dart';
import 'package:finance_tracking/providers/category/category_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'category_provider.g.dart';

@riverpod
class CategoryProvider extends _$CategoryProvider {
  late GlobalKey<FormState> formKey;
  late DatabaseHelper databaseHelper;
  late TextEditingController categoryNameController;
  late TextEditingController categoryBudgetController;
  late TextEditingController categoryBudgetDurationController;
  late TextEditingController filterSelectedCategoryController;

  @override
  CategoryState build({required WidgetRef widgetRef, CategoryModel? category}) {
    databaseHelper = widgetRef.watch(databaseHelperProvider);
    initWidgets();
    return CategoryState.initial(
      category: category,
      eCategoryState: ECategoryState.ready,
    );
  }

  void updateValuesForEditCategory() {
    categoryNameController.text = state.category?.categoryName ?? "";
    updateShowBudgetFields(state.category?.budgetAmount != null);
    categoryBudgetController.text =
        (state.category?.budgetAmount ?? 0).toString();
    if (state.category?.duration != null) {
      categoryBudgetDurationController.text =
          (state.category?.duration ?? 0).toString();
    }
    if (state.category?.budgetPeriod != null) {
      updateBudgetPeriod(
        BudgetPeriods.values.elementAt(state.category!.budgetPeriod!),
      );
    }
    setToInitialState();
  }

  void initWidgets() {
    categoryNameController = TextEditingController();
    categoryBudgetController = TextEditingController();
    categoryBudgetDurationController = TextEditingController();
    formKey = GlobalKey<FormState>();
    filterSelectedCategoryController = TextEditingController();
  }

  void updateBudgetPeriod(BudgetPeriods period) {
    state = state.copyWith(selectedBudgetPeriod: period);
  }

  void resetWidgets() {
    filterSelectedCategoryController.clear();
    categoryNameController.clear();
    categoryBudgetController.clear();
    categoryBudgetDurationController.clear();
    state = state.copyWith(category: null, selectedBudgetPeriod: null);
  }

  void updateSelectedCategory(CategoryModel category) {
    filterSelectedCategoryController.text = category.categoryName ?? '';
    state = state.copyWith(category: category);
  }

  Future<void> getCategories() async {
    state = state.copyWith(eCategoryState: ECategoryState.loading);
    final String categoryName = categoryNameController.text.trim();
    final String budgetAmount = categoryBudgetController.text.trim();
    final String duration = categoryBudgetDurationController.text.trim();
    final result = await databaseHelper.getCategories(
      categoryName: categoryName.isNotEmpty ? categoryName : null,
      budgetAmount:
          budgetAmount.isNotEmpty ? double.tryParse(budgetAmount) : null,
      duration: duration.isNotEmpty ? int.tryParse(duration) : null,
      budgetPeriod: state.selectedBudgetPeriod?.index,
    );
    result.fold(
      (l) {
        state = state.copyWith(
          eCategoryState: ECategoryState.error,
          message: l,
          categories: [],
        );
        setToInitialState();
      },
      (r) {
        state = state.copyWith(
          eCategoryState: ECategoryState.success,
          categories: r,
        );
        setToInitialState();
      },
    );
  }

  Future<void> getCategory(int categoryId) async {
    state = state.copyWith(eCategoryState: ECategoryState.loading);
    final result = await databaseHelper.getCategory(categoryId);
    result.fold(
      (l) {
        state = state.copyWith(
          eCategoryState: ECategoryState.error,
          message: l,
        );
        setToInitialState();
      },
      (r) {
        updateSelectedCategory(r);
        setToInitialState();
      },
    );
  }

  void updateShowBudgetFields(bool? show) {
    state = state.copyWith(showBudgetFields: show ?? false);
  }

  bool validateForm() {
    bool isVaidate = formKey.currentState!.validate();
    if (state.showBudgetFields && state.selectedBudgetPeriod == null) {
      isVaidate = false;
    }
    return isVaidate;
  }

  Future<void> createCategory() async {
    if (validateForm()) {
      state = state.copyWith(eCategoryState: ECategoryState.loading);
      final result = await databaseHelper.addCategory(
        CategoryModel(
          categoryName: categoryNameController.text.trim(),
          budgetAmount:
              state.showBudgetFields &&
                      categoryBudgetController.text.trim().isNotEmpty
                  ? double.parse(categoryBudgetController.text.trim())
                  : null,
          budgetPeriod:
              state.showBudgetFields &&
                      categoryBudgetController.text.trim().isNotEmpty &&
                      state.selectedBudgetPeriod != null
                  ? state.selectedBudgetPeriod!.index
                  : null,
          budgetSetDate:
              state.showBudgetFields &&
                      categoryBudgetController.text.trim().isNotEmpty
                  ? DateTime.now().toString()
                  : null,
          duration:
              state.showBudgetFields &&
                      categoryBudgetController.text.trim().isNotEmpty
                  ? int.tryParse(categoryBudgetDurationController.text.trim())
                  : null,
        ),
      );
      result.fold(
        (l) {
          state = state.copyWith(
            message: l,
            eCategoryState: ECategoryState.error,
          );
          setToInitialState();
        },
        (r) {
          state = state.copyWith(
            message: r,
            eCategoryState: ECategoryState.success,
          );
          setToInitialState();
        },
      );
    } else {
      state = state.copyWith(
        message: 'Please fill all the mandatory fields',
        eCategoryState: ECategoryState.error,
      );
      setToInitialState();
    }
  }

  Future<void> updateCategoryFromCreateTransaction(
    CategoryModel category,
  ) async {
    state = state.copyWith(
      eCategoryState: ECategoryState.updatingCategoryForTransaction,
    );
    final result = await databaseHelper.editCategory(category);
    result.fold(
      (l) {
        state = state.copyWith(
          message: l,
          eCategoryState: ECategoryState.error,
        );
        setToInitialState();
      },
      (r) {
        state = state.copyWith(
          message: r,
          eCategoryState: ECategoryState.success,
        );
        setToInitialState();
      },
    );
  }

  Future<void> editCategory() async {
    if (validateForm()) {
      state = state.copyWith(eCategoryState: ECategoryState.loading);
      final result = await databaseHelper.editCategory(
        CategoryModel(
          id: state.category?.id,
          categoryName: categoryNameController.text.trim(),
          budgetAmount:
              state.showBudgetFields &&
                      categoryBudgetController.text.trim().isNotEmpty
                  ? double.parse(categoryBudgetController.text.trim())
                  : null,
          budgetPeriod:
              state.showBudgetFields &&
                      categoryBudgetController.text.trim().isNotEmpty &&
                      state.selectedBudgetPeriod != null
                  ? state.selectedBudgetPeriod!.index
                  : null,
          budgetSetDate:
              state.showBudgetFields &&
                      categoryBudgetController.text.trim().isNotEmpty
                  ? DateTime.now().toString()
                  : null,
          duration:
              state.showBudgetFields &&
                      categoryBudgetController.text.trim().isNotEmpty
                  ? int.tryParse(categoryBudgetDurationController.text.trim())
                  : null,
        ),
      );
      result.fold(
        (l) {
          state = state.copyWith(
            message: l,
            eCategoryState: ECategoryState.error,
          );
          setToInitialState();
        },
        (r) {
          state = state.copyWith(
            message: r,
            eCategoryState: ECategoryState.success,
          );
          setToInitialState();
        },
      );
    } else {
      state = state.copyWith(
        message: 'Please fill all the mandatory fields',
        eCategoryState: ECategoryState.error,
      );
      setToInitialState();
    }
  }

  Future<void> deleteCategory(int categoryId) async {
    state = state.copyWith(eCategoryState: ECategoryState.loading);
    final result = await databaseHelper.deleteCategory(categoryId);
    result.fold(
      (l) {
        state = state.copyWith(
          message: l,
          eCategoryState: ECategoryState.error,
        );
        setToInitialState();
      },
      (r) {
        state = state.copyWith(
          message: r,
          eCategoryState: ECategoryState.successDelete,
        );
      },
    );
  }

  void setToInitialState() {
    state = state.copyWith(
      eCategoryState: ECategoryState.initial,
      message: null,
    );
  }
}
