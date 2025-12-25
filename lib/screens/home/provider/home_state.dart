import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  factory HomeState({
    @Default(HomeTabs.dashboard) HomeTabs currentTab,
    @Default(0) int selectedChartCategoryId,
  }) = _HomeState;

  factory HomeState.initial() => HomeState();
}

enum HomeTabs {
  dashboard,
  transaction,
  category,
}
