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
      budgetAmount: json['budgetAmount'],
      duration: (json['duration'] as num?)?.toInt(),
      budgetPeriod: (json['budgetPeriod'] as num?)?.toInt(),
      budgetSetDate: json['budgetSetDate'] as String?,
    );

Map<String, dynamic> _$CategoryModelToJson(_CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryName': instance.categoryName,
      'totalExpense': instance.totalExpense,
      'budgetAmount': instance.budgetAmount,
      'duration': instance.duration,
      'budgetPeriod': instance.budgetPeriod,
      'budgetSetDate': instance.budgetSetDate,
    };
