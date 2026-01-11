import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
abstract class TransactionModel with _$TransactionModel {
  factory TransactionModel({
    num? amount,
    int? categoryId,
    String? date,
    String? name,
    int? type,
    int? id,
    int? budgetId,
    @Default(0) int isIncomeAddedInBudget,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}

enum TransactionType {
  expense,
  income,
}
