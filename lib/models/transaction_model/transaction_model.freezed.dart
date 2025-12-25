// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionModel {

 dynamic get amount; int? get categoryId; String? get date; String? get notes; int? get type; int? get id;
/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionModelCopyWith<TransactionModel> get copyWith => _$TransactionModelCopyWithImpl<TransactionModel>(this as TransactionModel, _$identity);

  /// Serializes this TransactionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionModel&&const DeepCollectionEquality().equals(other.amount, amount)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.date, date) || other.date == date)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(amount),categoryId,date,notes,type,id);

@override
String toString() {
  return 'TransactionModel(amount: $amount, categoryId: $categoryId, date: $date, notes: $notes, type: $type, id: $id)';
}


}

/// @nodoc
abstract mixin class $TransactionModelCopyWith<$Res>  {
  factory $TransactionModelCopyWith(TransactionModel value, $Res Function(TransactionModel) _then) = _$TransactionModelCopyWithImpl;
@useResult
$Res call({
 dynamic amount, int? categoryId, String? date, String? notes, int? type, int? id
});




}
/// @nodoc
class _$TransactionModelCopyWithImpl<$Res>
    implements $TransactionModelCopyWith<$Res> {
  _$TransactionModelCopyWithImpl(this._self, this._then);

  final TransactionModel _self;
  final $Res Function(TransactionModel) _then;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = freezed,Object? categoryId = freezed,Object? date = freezed,Object? notes = freezed,Object? type = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as dynamic,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TransactionModel implements TransactionModel {
   _TransactionModel({this.amount, this.categoryId, this.date, this.notes, this.type, this.id});
  factory _TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);

@override final  dynamic amount;
@override final  int? categoryId;
@override final  String? date;
@override final  String? notes;
@override final  int? type;
@override final  int? id;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionModelCopyWith<_TransactionModel> get copyWith => __$TransactionModelCopyWithImpl<_TransactionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionModel&&const DeepCollectionEquality().equals(other.amount, amount)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.date, date) || other.date == date)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(amount),categoryId,date,notes,type,id);

@override
String toString() {
  return 'TransactionModel(amount: $amount, categoryId: $categoryId, date: $date, notes: $notes, type: $type, id: $id)';
}


}

/// @nodoc
abstract mixin class _$TransactionModelCopyWith<$Res> implements $TransactionModelCopyWith<$Res> {
  factory _$TransactionModelCopyWith(_TransactionModel value, $Res Function(_TransactionModel) _then) = __$TransactionModelCopyWithImpl;
@override @useResult
$Res call({
 dynamic amount, int? categoryId, String? date, String? notes, int? type, int? id
});




}
/// @nodoc
class __$TransactionModelCopyWithImpl<$Res>
    implements _$TransactionModelCopyWith<$Res> {
  __$TransactionModelCopyWithImpl(this._self, this._then);

  final _TransactionModel _self;
  final $Res Function(_TransactionModel) _then;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = freezed,Object? categoryId = freezed,Object? date = freezed,Object? notes = freezed,Object? type = freezed,Object? id = freezed,}) {
  return _then(_TransactionModel(
amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as dynamic,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
