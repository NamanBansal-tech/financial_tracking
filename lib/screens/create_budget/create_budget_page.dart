import 'package:finance_tracking/models/budget_model/budget_model.dart';
import 'package:finance_tracking/screens/create_budget/ui/create_budget_body.dart';
import 'package:flutter/material.dart';

class CreateBudgetPage extends StatelessWidget {
  const CreateBudgetPage({
    super.key,
    required this.fromOtherPage,
    this.budget,
  });

  final bool fromOtherPage;
  final BudgetModel? budget;

  static Route<dynamic> route({
    required bool fromOtherPage,
    BudgetModel? budget,
  }) {
    return MaterialPageRoute(
      builder: (_) => CreateBudgetPage(
        fromOtherPage: fromOtherPage,
        budget: budget,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CreateBudgetBody(
      fromOtherPage: fromOtherPage,
      budget: budget,
    );
  }
}
