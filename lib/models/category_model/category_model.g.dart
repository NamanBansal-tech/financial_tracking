// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    _CategoryModel(
      id: (json['id'] as num?)?.toInt(),
      categoryName: json['categoryName'] as String?,
      totalExpense: (json['totalExpense'] as num?)?.toDouble(),
      budgetAmount: json['budgetAmount'] as num?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
    );

Map<String, dynamic> _$CategoryModelToJson(_CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryName': instance.categoryName,
      'totalExpense': instance.totalExpense,
      'budgetAmount': instance.budgetAmount,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
