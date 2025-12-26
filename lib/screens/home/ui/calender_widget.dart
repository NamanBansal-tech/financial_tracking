import 'package:finance_tracking/models/transaction_model/transaction_model.dart';
import 'package:finance_tracking/screens/transaction_list/transactions_list_page.dart';
import 'package:finance_tracking/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderWidget extends StatelessWidget {
  const CalenderWidget({
    super.key,
    required this.selectedMonth,
    required this.transactions,
  });

  final DateTime selectedMonth;
  final List<TransactionModel> transactions;

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          Text(
            Utility.calenderMonthFormatDate(selectedMonth),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 24),
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: selectedMonth,
            headerVisible: false,
            availableGestures: AvailableGestures.none,
            onDisabledDayTapped: (day) =>
                _openTransactions(context, day),
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, _) {
                final dayTransactions = transactions.where((e) =>
                    _isSameDay(DateTime.parse(e.date!), day));

                final expense = dayTransactions
                    .where((e) => e.type == 0)
                    .fold<double>(0, (s, e) => s + e.amount);

                final income = dayTransactions
                    .where((e) => e.type == 1)
                    .fold<double>(0, (s, e) => s + e.amount);

                final color =
                    expense > income ? Colors.red : income > expense
                        ? Colors.green
                        : null;

                return InkWell(
                  onTap: () => _openTransactions(context, day),
                  child: CircleAvatar(
                    backgroundColor: color,
                    child: Text(
                      '${day.day}',
                      style: TextStyle(
                        color: color != null ? Colors.white : null,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _openTransactions(BuildContext context, DateTime day) {
    Navigator.push(
      context,
      TransactionsListPage.route(transactionDate: day),
    );
  }
}
