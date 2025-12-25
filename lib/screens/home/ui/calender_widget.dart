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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Text(
            Utility.calenderMonthFormatDate(selectedMonth),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 24),
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            onDisabledDayTapped: (day) {
              Navigator.push(
                context,
                TransactionsListPage.route(transactionDate: day),
              );
            },
            lastDay: DateTime.utc(2030, 3, 14),
            headerVisible: false,
            focusedDay: DateTime.now(), //need to pass for mannual any month
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                final filteredTransactions =
                    transactions.where((e) {
                      final transactionDate = DateTime.parse(e.date!);
                      return transactionDate.day == day.day &&
                          transactionDate.month == day.month &&
                          transactionDate.year == day.year;
                    }).toList();
                double totalExpenses = filteredTransactions
                    .where((e) => e.type == 0)
                    .fold(0.0, (sum, e) => sum + e.amount);
                double totalIncome = filteredTransactions
                    .where((e) => e.type == 1)
                    .fold(0.0, (sum, e) => sum + e.amount);

                final bool isExpenseLarger = totalExpenses > totalIncome;
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      TransactionsListPage.route(transactionDate: day),
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor:
                        isExpenseLarger
                            ? Colors.red
                            : totalExpenses < totalIncome
                            ? Colors.green
                            : null,
                    child: Text(
                      day.day.toString(),
                      style: TextStyle(
                        color: isExpenseLarger ? Colors.white : null,
                      ),
                    ),
                  ),
                );
              },
            ),
            availableGestures: AvailableGestures.none,
          ),
        ],
      ),
    );
  }
}
