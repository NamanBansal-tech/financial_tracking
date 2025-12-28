import 'package:finance_tracking/screens/budget_list/ui/budget_list.dart';
import 'package:flutter/material.dart';

class BudgetListPage extends StatelessWidget {
  const BudgetListPage({super.key, required this.fromOtherPage});

  final bool fromOtherPage;

  static Route<dynamic> route({required bool fromOtherPage}) {
    return MaterialPageRoute(
      builder: (_) => BudgetListPage(fromOtherPage: fromOtherPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BudgetList(fromOtherPage: fromOtherPage);
  }
}
