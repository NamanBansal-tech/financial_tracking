import 'package:finance_tracking/providers/common_provider/common_state.dart';
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
              icon: Image.asset(
                getCurrentTabImage(e),
                height: 25,
                width: 25,
                color: e.index == currentIndex ? Colors.amber : Colors.grey,
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

  String getCurrentTabImage(HomeTabs homeTab) {
    switch (homeTab) {
      case HomeTabs.dashboard:
        return "assets/images/ic_home_page.png";
      case HomeTabs.transaction:
        return "assets/images/ic_transactions.png";
      case HomeTabs.category:
        return "assets/images/ic_categories.png";
      case HomeTabs.budget:
        return "assets/images/ic_budget.png";
    }
  }
}
