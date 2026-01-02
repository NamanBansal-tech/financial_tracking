import 'package:finance_tracking/models/pie_chart/pie_chart_model.dart';
import 'package:finance_tracking/utils/app_colors.dart';
import 'package:finance_tracking/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pie_chart/pie_chart.dart';

class BudgetChart extends StatelessWidget {
  const BudgetChart({super.key, required this.data});

  final PieChartModel? data;

  @override
  Widget build(BuildContext context) {
    final totalBudget = data?.totalBudget?.toDouble() ?? 0;
    final totalSpent =
        data?.items.fold<double>(
          0,
          (sum, e) => sum + (e.totalExpense?.toDouble() ?? 0),
        ) ??
        0;
    final remaining = (totalBudget - totalSpent).clamp(0, totalBudget);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300, width: 1.w),
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${data?.budgetName ?? ''} Budget',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _amountTile(
                label: 'Total',
                value: totalBudget,
                color: Colors.black87,
              ),
              _amountTile(
                label: 'Spent',
                value: totalSpent,
                color: AppColors.expenseColor,
              ),
              _amountTile(
                label: 'Remaining',
                value: remaining,
                color: AppColors.incomeColor,
              ),
            ],
          ),
          SizedBox(height: 16.h),
          PieChart(
            dataMap: data == null
                ? {}
                : Map.fromEntries(
                    data!.items.map(
                      (e) => MapEntry(
                        _legendLabel(
                          amount: e.totalExpense,
                          name: Utility.makeFirstLetterCapital(e.categoryName),
                        ),
                        (e.totalExpense?.toDouble() ?? 0.0),
                      ),
                    ),
                  ),
            baseChartColor: AppColors.availableBalanceBg,
            totalValue: totalBudget,
            colorList: List<Color>.generate(
              data!.items.length,
              (index) =>
                  AppColors.categoryColors[index %
                      AppColors.categoryColors.length],
            ),
            chartValuesOptions: const ChartValuesOptions(
              showChartValues: false,
              showChartValueBackground: false,
            ),
            centerWidget: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 3.r,
            ),
            legendOptions: LegendOptions(
              showLegends: true,
              legendPosition: LegendPosition.right,
              showLegendsInRow: false,
              legendShape: BoxShape.circle,
              legendTextStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _amountTile({
    required String label,
    required num value,
    required Color color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
        ),
        SizedBox(height: 4.h),
        Text(
          value.toStringAsFixed(0),
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }

  String _legendLabel({required String? name, required num? amount}) {
    final int lengthLimit = 14;
    final shortName = (name?.length ?? 0) > lengthLimit
        ? '${name?.substring(0, lengthLimit)}…'
        : name;
    return shortName ?? "";
  }
}
