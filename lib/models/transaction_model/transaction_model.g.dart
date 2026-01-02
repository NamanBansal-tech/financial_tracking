// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    _TransactionModel(
      amount: json['amount'] as num?,
      categoryId: (json['categoryId'] as num?)?.toInt(),
      date: json['date'] as String?,
      name: json['name'] as String?,
      type: (json['type'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      budgetId: (json['budgetId'] as num?)?.toInt(),
      isIncomeAddedInBudget:
          (json['isIncomeAddedInBudget'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$TransactionModelToJson(_TransactionModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'categoryId': instance.categoryId,
      'date': instance.date,
      'name': instance.name,
      'type': instance.type,
      'id': instance.id,
      'budgetId': instance.budgetId,
      'isIncomeAddedInBudget': instance.isIncomeAddedInBudget,
    };
