// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    _TransactionModel(
      amount: json['amount'],
      categoryId: (json['categoryId'] as num?)?.toInt(),
      date: json['date'] as String?,
      notes: json['notes'] as String?,
      type: (json['type'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TransactionModelToJson(_TransactionModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'categoryId': instance.categoryId,
      'date': instance.date,
      'notes': instance.notes,
      'type': instance.type,
      'id': instance.id,
    };
