import 'package:finance_tracking/database/chart_model.dart';
import 'package:finance_tracking/models/transaction_model/transaction_model.dart';
import 'package:finance_tracking/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TransactionsLineChart extends StatelessWidget {
  const TransactionsLineChart({super.key, required this.transactions});

  final List<TransactionModel> transactions;

  @override
  Widget build(BuildContext context) {
    List<ChartData> expenseData = [];
    List<ChartData> incomeData = [];
    for (var transaction in transactions) {
      DateTime transactionDate = DateTime.parse(transaction.date!);
      double amount = (transaction.amount ?? 0.0).toDouble();
      if (transaction.type == 0) {
        // Expense
        expenseData.add(ChartData(transactionDate, amount));
      } else if (transaction.type == 1) {
        // Income
        incomeData.add(ChartData(transactionDate, amount));
      }
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey, width: 1.w),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      child: SfCartesianChart(
        primaryXAxis: DateTimeAxis(
          dateFormat: DateFormat('d'),
          intervalType: DateTimeIntervalType.days,
        ),
        legend: Legend(isVisible: true, position: LegendPosition.bottom),
        series: <CartesianSeries>[
          LineSeries<ChartData, DateTime>(
            name: 'Expense',
            dataSource: expenseData,
            xValueMapper: (ChartData data, _) => data.date,
            yValueMapper: (ChartData data, _) => data.amount,
            color: AppColors.expenseColor,
          ),
          LineSeries<ChartData, DateTime>(
            name: 'Income',
            dataSource: incomeData,
            xValueMapper: (ChartData data, _) => data.date,
            yValueMapper: (ChartData data, _) => data.amount,
            color: AppColors.incomeColor,
          ),
        ],
        tooltipBehavior: TooltipBehavior(enable: true),
      ),
    );
  }
}
