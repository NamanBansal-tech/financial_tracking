import 'package:finance_tracking/screens/home/provider/home_state.dart';
import 'package:intl/intl.dart';

class Utility {
  static String formatDate(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }

  static String calenderMonthFormatDate(DateTime date) {
    return DateFormat('MMMM, yyyy').format(date);
  }

  static String getCurrentTabLabel(HomeTabs homeTab) {
    switch (homeTab) {
      case HomeTabs.dashboard:
        return "Dashboard";
      case HomeTabs.transaction:
        return "Transactions";
      case HomeTabs.category:
        return "Categories";
    }
  }

  static String? getDateFromDateTime(DateTime? dateTime) {
    if (dateTime == null) {
      return null;
    }
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  static String makeFirstLetterCapital(String value) {
    if (value.isEmpty) {
      return '';
    }
    if (value.length == 1) {
      return value.toUpperCase();
    } else {
      return '${value.substring(0, 1).toUpperCase()}${value.substring(1).toLowerCase()}';
    }
  }

  static String getDisplayNameforBudgetPeriod(int budgerPeriodIndex) {
    switch (budgerPeriodIndex) {
      case 0:
        return 'Week(s)';
      case 1:
        return 'Month(s)';
      case 2:
        return 'Quaters(s)';
      case 3:
        return 'Year(s)';
      default:
        return 'Week(s)';
    }
  }
}
