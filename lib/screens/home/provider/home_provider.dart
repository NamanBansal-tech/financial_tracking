import 'package:finance_tracking/screens/home/provider/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

@riverpod
class HomeProvider extends _$HomeProvider {
  @override
  HomeState build() {
    return HomeState.initial();
  }

  void updateBottomNavigationBarIndex(HomeTabs currentTab) {
    state = state.copyWith(currentTab: currentTab);
  }
}
