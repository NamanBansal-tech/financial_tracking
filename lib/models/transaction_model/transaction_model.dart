import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
abstract class TransactionModel with _$TransactionModel {
  factory TransactionModel({
    dynamic amount,
    int? categoryId,
    String? date,
    String? notes,
    int? type,
    int? id,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}

enum TransactionType {
  expense,
  income,
}
