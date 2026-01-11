import 'package:flutter/material.dart';

class AppColors {
  // 🌗 Base
  static const Color background = Color(0xFFF7F8FA);
  static const Color surface = Colors.white;
  static const Color divider = Color(0xFFE5E7EB);

  // 🎨 Primary palette
  static const Color primary = Color(0xFFFFC107); // ⭐ amber primary
  static const Color primaryLight = Color(0xFFFFF3CD);
  static const Color primaryDark = Color(0xFFB45309);

  // 📝 Text
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textHint = Color(0xFF9CA3AF);

  // 🚨 Status
  static const Color error = Color(0xFFDC2626);
  static const Color success = Color(0xFF16A34A);
  static const Color warning = Color(0xFFF59E0B);

  // 🧭 Bottom Navigation
  static const Color bottomNavSelected = primary;
  static const Color bottomNavUnselected = Color(0xFF9CA3AF);

  // 📆 Calendar
  static const Color calendarSelectedNeutral = primary;
  static const Color calendarSelectedText = Color(0xFF111827);
  static const Color calendarSelectedBg = Color(0xFFFFF3CD); // Soft yellow

  // 📅 Today highlight
  static const Color calendarTodayBg = Color(0xFFFFF8E1); // ultra-light amber
  static const Color calendarTodayText = Color(0xFF111827); // dark text
  static const Color calendarTodayBorder = Color(0xFFFFC107); // primary amber

  // ⏳ Loader
  static const Color loader = primary;

  // Tooltip / Popover (neutral – no semantic meaning)
  static const Color tooltipBg = Color(0xFF1F2937); // Slate-800
  static const Color tooltipText = Color(0xFFF9FAFB); // Almost white
  static const Color tooltipSubText = Color(0xFFD1D5DB); // Gray-300
  static const Color tooltipDivider = Color(0xFF374151); // Slate-700

  // transaction type color
  static const Color incomeColor = success;
  static const Color expenseColor = error;

  // pie chart colors
  static const List<Color> categoryColors = [
    Color(0xFFDC2626), // red
    Color(0xFFF59E0B), // amber
    Color(0xFF10B981), // green
    Color(0xFF3B82F6), // blue
    Color(0xFF8B5CF6), // purple
    Color(0xFFEC4899), // pink
    Color(0xFF14B8A6), // teal
    Color(0xFFF97316), // orange
  ];
  static const Color availableBalanceBg = Color(0xFFEAF4EC);

  // custom button
  static const Color buttonDisabledBg = Color(0xFFF1F1F1);
  static const Color buttonDisabledText = Color(0xFF9CA3AF);

  // Toast backgrounds
  static const Color toastErrorBg = Color(0xFFFEE2E2); // soft red
  static const Color toastSuccessBg = Color(0xFFD1FAE5); // soft green
  static const Color toastInfoBg = Color(0xFFFFF3CD); // soft amber

  // Toast text
  static const Color toastErrorText = Color(0xFF991B1B);
  static const Color toastSuccessText = Color(0xFF065F46);
  static const Color toastInfoText = Color(0xFF92400E);
}
