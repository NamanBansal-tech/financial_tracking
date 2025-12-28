import 'package:finance_tracking/models/pie_chart/pie_chart_model.dart';
import 'package:finance_tracking/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class BudgetChart extends StatelessWidget {
  const BudgetChart({super.key, required this.data});

  final PieChartModel? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        children: [
          Text(
            '${data?.budgetName ?? 'N/A'} Budget (${data?.totalBudget ?? ""})',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          PieChart(
            dataMap: data == null
                ? {}
                : Map.fromEntries(
                    data!.items.map(
                      (e) => MapEntry(
                        Utility.makeFirstLetterCapital(e.categoryName),
                        (e.totalExpense?.toDouble() ?? 0.0),
                      ),
                    ),
                  ),
            baseChartColor: Colors.amber,
            totalValue: data?.totalBudget?.toDouble(),
            colorList: [Colors.red],
          ),
        ],
      ),
    );
  }
}
