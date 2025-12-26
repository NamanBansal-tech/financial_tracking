extension DateMonthExt on DateTime {
  DateTime get firstDayOfMonth => DateTime(year, month, 1);
  DateTime get lastDayOfMonth => DateTime(year, month + 1, 0);
}
