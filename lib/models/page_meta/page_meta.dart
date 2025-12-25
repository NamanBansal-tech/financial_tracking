import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_meta.freezed.dart';
part 'page_meta.g.dart';

@freezed
abstract class PageMeta with _$PageMeta {
  factory PageMeta({
    @Default(0) int offset,
    @Default(10) int limit,
    @Default(true) bool hasNext,
  }) = _PageMeta;

  factory PageMeta.fromJson(Map<String, dynamic> json) =>
      _$PageMetaFromJson(json);
}
