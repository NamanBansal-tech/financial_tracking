import 'package:finance_tracking/models/category_model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class BudgetChart extends StatelessWidget {
  const BudgetChart({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        children: [
          Text(
            '${category.categoryName ?? 'N/A'} Budget (${category.budgetAmount})',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          PieChart(
            dataMap: {
              'Expenses': category.totalExpense ?? 0,
            },
            baseChartColor: Colors.amber,
            totalValue: category.budgetAmount?.toDouble(),
            colorList: [
              Colors.red,
            ],
          ),
        ],
      ),
    );
  }
}
