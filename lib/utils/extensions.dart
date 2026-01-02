import 'package:flutter/material.dart';

extension DateMonthExt on DateTime {
  DateTime get firstDayOfMonth => DateTime(year, month, 1);
  DateTime get lastDayOfMonth => DateTime(year, month + 1, 0);
}

extension Size on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}
