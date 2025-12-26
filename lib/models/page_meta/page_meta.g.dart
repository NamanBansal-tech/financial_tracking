// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PageMeta _$PageMetaFromJson(Map<String, dynamic> json) => _PageMeta(
  offset: (json['offset'] as num?)?.toInt() ?? 0,
  limit: (json['limit'] as num?)?.toInt() ?? 10,
  hasNext: json['hasNext'] as bool? ?? true,
);

Map<String, dynamic> _$PageMetaToJson(_PageMeta instance) => <String, dynamic>{
  'offset': instance.offset,
  'limit': instance.limit,
  'hasNext': instance.hasNext,
};
