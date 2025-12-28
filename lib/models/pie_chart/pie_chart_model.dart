import 'package:finance_tracking/models/transaction_model/transaction_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pie_chart_model.freezed.dart';
part 'pie_chart_model.g.dart';

@freezed
abstract class PieChartModel with _$PieChartModel {
  factory PieChartModel({
    num? totalBudget,
    String? budgetName,
    @Default([]) List<PieChartItemModel> items,
  }) = _PieChartModel;

  factory PieChartModel.fromJson(Map<String, dynamic> json) =>
      _$PieChartModelFromJson(json);
}

@freezed
abstract class PieChartItemModel with _$PieChartItemModel {
  factory PieChartItemModel({
    String? categoryName,
    num? totalExpense,
    List<TransactionModel>? transactions,
  }) = _PieChartItemModel;

  factory PieChartItemModel.fromJson(Map<String, dynamic> json) =>
      _$PieChartItemModelFromJson(json);
}
