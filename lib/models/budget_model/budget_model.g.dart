// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BudgetModel _$BudgetModelFromJson(Map<String, dynamic> json) => _BudgetModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  totalExpense: json['totalExpense'] as num?,
  budgetAmount: json['budgetAmount'] as num?,
  startDate: json['startDate'] as String?,
  endDate: json['endDate'] as String?,
);

Map<String, dynamic> _$BudgetModelToJson(_BudgetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'totalExpense': instance.totalExpense,
      'budgetAmount': instance.budgetAmount,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
