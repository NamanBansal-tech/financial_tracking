// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 HomeTabs get currentTab; int get selectedChartCategoryId;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.currentTab, currentTab) || other.currentTab == currentTab)&&(identical(other.selectedChartCategoryId, selectedChartCategoryId) || other.selectedChartCategoryId == selectedChartCategoryId));
}


@override
int get hashCode => Object.hash(runtimeType,currentTab,selectedChartCategoryId);

@override
String toString() {
  return 'HomeState(currentTab: $currentTab, selectedChartCategoryId: $selectedChartCategoryId)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 HomeTabs currentTab, int selectedChartCategoryId
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentTab = null,Object? selectedChartCategoryId = null,}) {
  return _then(_self.copyWith(
currentTab: null == currentTab ? _self.currentTab : currentTab // ignore: cast_nullable_to_non_nullable
as HomeTabs,selectedChartCategoryId: null == selectedChartCategoryId ? _self.selectedChartCategoryId : selectedChartCategoryId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _HomeState implements HomeState {
   _HomeState({this.currentTab = HomeTabs.dashboard, this.selectedChartCategoryId = 0});
  

@override@JsonKey() final  HomeTabs currentTab;
@override@JsonKey() final  int selectedChartCategoryId;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.currentTab, currentTab) || other.currentTab == currentTab)&&(identical(other.selectedChartCategoryId, selectedChartCategoryId) || other.selectedChartCategoryId == selectedChartCategoryId));
}


@override
int get hashCode => Object.hash(runtimeType,currentTab,selectedChartCategoryId);

@override
String toString() {
  return 'HomeState(currentTab: $currentTab, selectedChartCategoryId: $selectedChartCategoryId)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 HomeTabs currentTab, int selectedChartCategoryId
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentTab = null,Object? selectedChartCategoryId = null,}) {
  return _then(_HomeState(
currentTab: null == currentTab ? _self.currentTab : currentTab // ignore: cast_nullable_to_non_nullable
as HomeTabs,selectedChartCategoryId: null == selectedChartCategoryId ? _self.selectedChartCategoryId : selectedChartCategoryId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
