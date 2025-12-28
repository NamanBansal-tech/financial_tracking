import 'package:finance_tracking/models/category_model/category_model.dart';
import 'package:finance_tracking/models/page_meta/page_meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_state.freezed.dart';

@freezed
abstract class CategoryState with _$CategoryState {
  factory CategoryState({
    @Default(EState.initial) EState eState,
    String? message,
    required PageMeta pageMeta,
    @Default([]) List<CategoryModel> categories,
    CategoryModel? category,
    int? selectedBudgetId,
  }) = _CategoryState;

  factory CategoryState.initial({
    CategoryModel? category,
    required EState eState,
  }) => CategoryState(
    category: category,
    eState: eState,
    pageMeta: PageMeta(),
  );
}

enum EState {
  initial,
  ready,
  success,
  error,
  loading,
  updatingBudgetForTransaction,
  successDelete,
}

enum EMoreOptions { edit, delete, select }
