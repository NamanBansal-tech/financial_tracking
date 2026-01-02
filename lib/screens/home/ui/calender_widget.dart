import 'package:finance_tracking/components/tooltip_arrow.dart';
import 'package:finance_tracking/models/transaction_model/transaction_model.dart';
import 'package:finance_tracking/screens/transaction_list/transactions_list_page.dart';
import 'package:finance_tracking/utils/app_colors.dart';
import 'package:finance_tracking/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderWidget extends StatelessWidget {
  CalenderWidget({
    super.key,
    required this.selectedMonth,
    required this.transactions,
  });

  final DateTime selectedMonth;
  final List<TransactionModel> transactions;

  final _calenderBackgroundColor = <int, Color>{
    0: AppColors.expenseColor,
    1: AppColors.incomeColor,
    2: AppColors.calendarTodayBg,
    3: AppColors.calendarSelectedBg,
  };

  final _calenderTextColor = <int, Color>{
    0: Colors.white,
    1: Colors.white,
    2: AppColors.calendarTodayText,
    3: AppColors.calendarSelectedText,
  };

  final now = DateTime.now();

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    Utility.calenderMonthFormatDate(selectedMonth),
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                toolTip(),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: selectedMonth,
            headerVisible: false,
            availableGestures: AvailableGestures.none,
            calendarStyle: CalendarStyle(
              cellPadding: EdgeInsets.zero,
              tablePadding: EdgeInsets.zero,
              isTodayHighlighted: false,
              todayDecoration: BoxDecoration(
                color: AppColors.calendarTodayBg,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.calendarTodayBorder,
                  width: 1.5.w,
                ),
              ),
              todayTextStyle: TextStyle(
                color: AppColors.calendarTodayText,
                fontWeight: FontWeight.w600,
              ),
            ),
            onDisabledDayTapped: (day) => _openTransactions(context, day),
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, _) {
                final dayTransactions = transactions.where(
                  (e) => _isSameDay(DateTime.parse(e.date!), day),
                );

                final isToday =
                    ((day.day == now.day) &&
                    (day.month == now.month) &&
                    (day.year == now.year));

                final expense = dayTransactions
                    .where((e) => e.type == 0)
                    .fold<double>(0, (s, e) => s + (e.amount ?? 0));

                final income = dayTransactions
                    .where((e) => e.type == 1)
                    .fold<double>(0, (s, e) => s + (e.amount ?? 0));

                final type = getCurrentDateType(
                  expense: expense,
                  income: income,
                  isToday: isToday,
                );

                return InkWell(
                  onTap: () => _openTransactions(context, day),
                  child: currentDay(day: day.day, isToday: isToday, type: type),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget currentDay({
    required bool isToday,
    required int type,
    required int day,
    EdgeInsetsGeometry? padding,
    double? fontSize,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: _calenderBackgroundColor[type],
        shape: BoxShape.circle,
        border: isToday
            ? Border.all(color: AppColors.calendarTodayBorder, width: 1.5.w)
            : null,
      ),
      padding: padding ?? EdgeInsets.all(12.w),
      child: Text(
        '$day',
        style: TextStyle(color: _calenderTextColor[type], fontSize: fontSize),
      ),
    );
  }

  Widget _legendItem({
    required Widget child,
    required String label,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: Row(
            children: [
              child,
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    color: AppColors.tooltipSubText,
                    fontSize: 11.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (showDivider)
          Divider(height: 1, thickness: 0.6, color: AppColors.tooltipDivider),
      ],
    );
  }

  int getCurrentDateType({
    required double expense,
    required double income,
    required bool isToday,
  }) {
    if (((expense > income))) {
      return 0;
    } else if (((income > expense))) {
      return 1;
    } else if ((isToday)) {
      return 2;
    }
    return 3;
  }

  void _openTransactions(BuildContext context, DateTime day) {
    Navigator.push(context, TransactionsListPage.route(transactionDate: day));
  }

  Widget toolTip() {
    return Tooltip(
      triggerMode: TooltipTriggerMode.tap,
      preferBelow: true,
      verticalOffset: 12,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(color: Colors.transparent),
      richMessage: WidgetSpan(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(right: 15.w, top: 5.w),
              child: TooltipArrow(color: AppColors.tooltipBg),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 240.w),
              decoration: BoxDecoration(
                color: AppColors.tooltipBg,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _legendItem(
                    child: currentDay(
                      day: now.add(const Duration(days: 2)).day,
                      isToday: false,
                      type: 0,
                      padding: EdgeInsets.all(6.w),
                      fontSize: 10.sp,
                    ),
                    label: 'Expense > Income',
                  ),

                  _legendItem(
                    child: currentDay(
                      day: now.add(const Duration(days: 2)).day,
                      isToday: false,
                      type: 1,
                      padding: EdgeInsets.all(6.w),
                      fontSize: 10.sp,
                    ),
                    label: 'Income > Expense',
                  ),

                  _legendItem(
                    child: currentDay(
                      day: now.day,
                      isToday: true,
                      type: 2,
                      padding: EdgeInsets.all(6.w),
                      fontSize: 10.sp,
                    ),
                    label: 'Today',
                  ),

                  _legendItem(
                    child: currentDay(
                      day: now.add(const Duration(days: 2)).day,
                      isToday: false,
                      type: 3,
                      padding: EdgeInsets.all(6.w),
                      fontSize: 10.sp,
                    ),
                    label: 'Normal day',
                    showDivider: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      child: const Icon(Icons.info_outline_rounded),
    );
  }
}
