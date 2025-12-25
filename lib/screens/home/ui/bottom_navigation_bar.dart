import 'package:finance_tracking/screens/home/provider/home_state.dart';
import 'package:finance_tracking/utils/utility.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: HomeTabs.values
          .map(
            (e) => BottomNavigationBarItem(
              icon: Icon(
                getCurrentTabIcon(e),
              ),
              label: Utility.getCurrentTabLabel(e),
            ),
          )
          .toList(),
      currentIndex: currentIndex,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.amberAccent,
      onTap: onTap,
    );
  }

  IconData getCurrentTabIcon(HomeTabs homeTab) {
    switch (homeTab) {
      case HomeTabs.dashboard:
        return Icons.av_timer_outlined;
      case HomeTabs.transaction:
        return Icons.home_rounded;
      case HomeTabs.category:
        return Icons.av_timer_outlined;
    }
  }
}
