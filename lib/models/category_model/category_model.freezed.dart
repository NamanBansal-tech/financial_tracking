// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryModel {

 int? get id; String? get categoryName; double? get totalExpense; dynamic get budgetAmount; int? get duration; int? get budgetPeriod; String? get budgetSetDate;
/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<CategoryModel> get copyWith => _$CategoryModelCopyWithImpl<CategoryModel>(this as CategoryModel, _$identity);

  /// Serializes this CategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.totalExpense, totalExpense) || other.totalExpense == totalExpense)&&const DeepCollectionEquality().equals(other.budgetAmount, budgetAmount)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.budgetPeriod, budgetPeriod) || other.budgetPeriod == budgetPeriod)&&(identical(other.budgetSetDate, budgetSetDate) || other.budgetSetDate == budgetSetDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryName,totalExpense,const DeepCollectionEquality().hash(budgetAmount),duration,budgetPeriod,budgetSetDate);

@override
String toString() {
  return 'CategoryModel(id: $id, categoryName: $categoryName, totalExpense: $totalExpense, budgetAmount: $budgetAmount, duration: $duration, budgetPeriod: $budgetPeriod, budgetSetDate: $budgetSetDate)';
}


}

/// @nodoc
abstract mixin class $CategoryModelCopyWith<$Res>  {
  factory $CategoryModelCopyWith(CategoryModel value, $Res Function(CategoryModel) _then) = _$CategoryModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? categoryName, double? totalExpense, dynamic budgetAmount, int? duration, int? budgetPeriod, String? budgetSetDate
});




}
/// @nodoc
class _$CategoryModelCopyWithImpl<$Res>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._self, this._then);

  final CategoryModel _self;
  final $Res Function(CategoryModel) _then;

/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? categoryName = freezed,Object? totalExpense = freezed,Object? budgetAmount = freezed,Object? duration = freezed,Object? budgetPeriod = freezed,Object? budgetSetDate = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,totalExpense: freezed == totalExpense ? _self.totalExpense : totalExpense // ignore: cast_nullable_to_non_nullable
as double?,budgetAmount: freezed == budgetAmount ? _self.budgetAmount : budgetAmount // ignore: cast_nullable_to_non_nullable
as dynamic,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,budgetPeriod: freezed == budgetPeriod ? _self.budgetPeriod : budgetPeriod // ignore: cast_nullable_to_non_nullable
as int?,budgetSetDate: freezed == budgetSetDate ? _self.budgetSetDate : budgetSetDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CategoryModel implements CategoryModel {
   _CategoryModel({this.id, this.categoryName, this.totalExpense, this.budgetAmount, this.duration, this.budgetPeriod, this.budgetSetDate});
  factory _CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

@override final  int? id;
@override final  String? categoryName;
@override final  double? totalExpense;
@override final  dynamic budgetAmount;
@override final  int? duration;
@override final  int? budgetPeriod;
@override final  String? budgetSetDate;

/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryModelCopyWith<_CategoryModel> get copyWith => __$CategoryModelCopyWithImpl<_CategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.totalExpense, totalExpense) || other.totalExpense == totalExpense)&&const DeepCollectionEquality().equals(other.budgetAmount, budgetAmount)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.budgetPeriod, budgetPeriod) || other.budgetPeriod == budgetPeriod)&&(identical(other.budgetSetDate, budgetSetDate) || other.budgetSetDate == budgetSetDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryName,totalExpense,const DeepCollectionEquality().hash(budgetAmount),duration,budgetPeriod,budgetSetDate);

@override
String toString() {
  return 'CategoryModel(id: $id, categoryName: $categoryName, totalExpense: $totalExpense, budgetAmount: $budgetAmount, duration: $duration, budgetPeriod: $budgetPeriod, budgetSetDate: $budgetSetDate)';
}


}

/// @nodoc
abstract mixin class _$CategoryModelCopyWith<$Res> implements $CategoryModelCopyWith<$Res> {
  factory _$CategoryModelCopyWith(_CategoryModel value, $Res Function(_CategoryModel) _then) = __$CategoryModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? categoryName, double? totalExpense, dynamic budgetAmount, int? duration, int? budgetPeriod, String? budgetSetDate
});




}
/// @nodoc
class __$CategoryModelCopyWithImpl<$Res>
    implements _$CategoryModelCopyWith<$Res> {
  __$CategoryModelCopyWithImpl(this._self, this._then);

  final _CategoryModel _self;
  final $Res Function(_CategoryModel) _then;

/// Create a copy of CategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? categoryName = freezed,Object? totalExpense = freezed,Object? budgetAmount = freezed,Object? duration = freezed,Object? budgetPeriod = freezed,Object? budgetSetDate = freezed,}) {
  return _then(_CategoryModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,totalExpense: freezed == totalExpense ? _self.totalExpense : totalExpense // ignore: cast_nullable_to_non_nullable
as double?,budgetAmount: freezed == budgetAmount ? _self.budgetAmount : budgetAmount // ignore: cast_nullable_to_non_nullable
as dynamic,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,budgetPeriod: freezed == budgetPeriod ? _self.budgetPeriod : budgetPeriod // ignore: cast_nullable_to_non_nullable
as int?,budgetSetDate: freezed == budgetSetDate ? _self.budgetSetDate : budgetSetDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
