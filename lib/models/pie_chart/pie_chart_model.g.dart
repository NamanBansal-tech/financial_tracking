// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pie_chart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PieChartModel _$PieChartModelFromJson(Map<String, dynamic> json) =>
    _PieChartModel(
      totalBudget: json['totalBudget'] as num?,
      budgetName: json['budgetName'] as String?,
      items:
          (json['items'] as List<dynamic>?)
              ?.map(
                (e) => PieChartItemModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PieChartModelToJson(_PieChartModel instance) =>
    <String, dynamic>{
      'totalBudget': instance.totalBudget,
      'budgetName': instance.budgetName,
      'items': instance.items,
    };

_PieChartItemModel _$PieChartItemModelFromJson(Map<String, dynamic> json) =>
    _PieChartItemModel(
      categoryName: json['categoryName'] as String?,
      totalExpense: json['totalExpense'] as num?,
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PieChartItemModelToJson(_PieChartItemModel instance) =>
    <String, dynamic>{
      'categoryName': instance.categoryName,
      'totalExpense': instance.totalExpense,
      'transactions': instance.transactions,
    };
