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
  late TextEditingController nameController;
  late TextEditingController filterSelectedCategoryController;

  @override
  CategoryState build({required WidgetRef widgetRef, CategoryModel? category}) {
    databaseHelper = widgetRef.watch(databaseHelperProvider);
    initWidgets();
    return CategoryState.initial(
      category: category,
      eState: EState.ready,
    );
  }

  void updateValuesForEditCategory() {
    nameController.text = state.category?.name ?? "";
    state = state.copyWith(selectedBudgetId: state.category?.budgetId);
    setToInitialState();
  }

  void initWidgets() {
    nameController = TextEditingController();
    filterSelectedCategoryController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  void resetWidgets() {
    nameController.clear();
    filterSelectedCategoryController.clear();
    state = state.copyWith(category: null, selectedBudgetId: null);
  }

  void updateSelectedCategory(CategoryModel category) {
    filterSelectedCategoryController.text = category.name ?? '';
    state = state.copyWith(category: category);
  }

  Future<void> getCategories() async {
    state = state.copyWith(eState: EState.loading);
    final String categoryName = nameController.text.trim();
    final result = await databaseHelper.getCategories(
      name: categoryName.isNotEmpty ? categoryName : null,
    );
    result.fold(
      (l) {
        state = state.copyWith(
          eState: EState.error,
          message: l,
          categories: [],
        );
        setToInitialState();
      },
      (r) {
        state = state.copyWith(categories: r);
        setToInitialState();
      },
    );
  }

  Future<void> getCategory(int categoryId) async {
    state = state.copyWith(eState: EState.loading);
    final result = await databaseHelper.getCategory(categoryId);
    result.fold(
      (l) {
        state = state.copyWith(
          eState: EState.error,
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

  Future<void> createCategory() async {
    if (formKey.currentState!.validate()) {
      state = state.copyWith(eState: EState.loading);
      CategoryModel category = CategoryModel(
        name: nameController.text.trim(),
        budgetId: state.selectedBudgetId,
      );
      final result = await databaseHelper.addCategory(category);
      result.fold(
        (l) {
          state = state.copyWith(
            message: l,
            eState: EState.error,
          );
          setToInitialState();
        },
        (r) {
          state = state.copyWith(
            message: r,
            eState: EState.success,
          );
          setToInitialState();
        },
      );
    } else {
      state = state.copyWith(
        message: 'Please fill all the mandatory fields',
        eState: EState.error,
      );
      setToInitialState();
    }
  }

  Future<void> editCategory() async {
    if (formKey.currentState!.validate()) {
      state = state.copyWith(eState: EState.loading);
      CategoryModel category = CategoryModel(
        id: state.category?.id,
        name: nameController.text.trim(),
        budgetId: state.selectedBudgetId,
      );
      final result = await databaseHelper.editCategory(category);
      result.fold(
        (l) {
          state = state.copyWith(
            message: l,
            eState: EState.error,
          );
          setToInitialState();
        },
        (r) {
          state = state.copyWith(
            message: r,
            eState: EState.success,
          );
          setToInitialState();
        },
      );
    } else {
      state = state.copyWith(
        message: 'Please fill all the mandatory fields',
        eState: EState.error,
      );
      setToInitialState();
    }
  }

  Future<void> deleteCategory(int categoryId) async {
    state = state.copyWith(eState: EState.loading);
    final result = await databaseHelper.deleteCategory(categoryId);
    result.fold(
      (l) {
        state = state.copyWith(
          message: l,
          eState: EState.error,
        );
        setToInitialState();
      },
      (r) {
        state = state.copyWith(
          message: r,
          eState: EState.successDelete,
        );
      },
    );
  }

  void setToInitialState() {
    state = state.copyWith(
      eState: EState.initial,
      message: null,
    );
  }
}
