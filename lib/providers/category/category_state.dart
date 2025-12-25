import 'package:finance_tracking/models/category_model/category_model.dart';
import 'package:finance_tracking/models/page_meta/page_meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_state.freezed.dart';

@freezed
abstract class CategoryState with _$CategoryState {
  factory CategoryState({
    @Default(ECategoryState.initial) ECategoryState eCategoryState,
    String? message,
    BudgetPeriods? selectedBudgetPeriod,
    @Default(false) bool showBudgetFields,
    required PageMeta pageMeta,
    @Default([]) List<CategoryModel> categories,
    CategoryModel? category,
  }) = _CategoryState;

  factory CategoryState.initial({
    CategoryModel? category,
    required ECategoryState eCategoryState,
  }) =>
      CategoryState(
        category: category,
        eCategoryState: eCategoryState,
        pageMeta: PageMeta(),
      );
}

enum ECategoryState {
  initial,
  ready,
  success,
  error,
  loading,
  updatingCategoryForTransaction,
  successDelete,
}

enum ECategoryOptions{
  edit,
  delete,
  select,
}
