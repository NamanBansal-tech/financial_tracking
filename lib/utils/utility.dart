import 'package:finance_tracking/providers/common_provider/common_state.dart';
import 'package:intl/intl.dart';

class Utility {
  static String formatDate(DateTime date) {
    return DateFormat('dd-MM-yyyy').format(date);
  }

  static String calenderMonthFormatDate(DateTime? date) {
    if ((date == null)) {
      return "";
    }
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
      case HomeTabs.budget:
        return "Budget";
    }
  }

  static String? getDateFromDateTime(DateTime? dateTime) {
    if (dateTime == null) {
      return null;
    }
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

static String makeFirstLetterCapital(String? value) {
  if (value == null || value.trim().isEmpty) return '';

  final text = value.trim();

  if (text.length == 1) {
    return text.toUpperCase();
  }

  return text[0].toUpperCase() + text.substring(1).toLowerCase();
}


  static String getFormattedBudgetDate(dynamic date) {
    try {
      if ((date == null)) {
        return "";
      }
      final dateFormat = DateFormat('dd MMM, yyyy');
      if (date is String) {
        final dateTime = DateTime.tryParse(date);
        if ((dateTime == null)) {
          return "";
        }
        return dateFormat.format(dateTime);
      }
      return dateFormat.format(date);
    } catch (e) {
      return "";
    }
  }
}
