import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppThemeData {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    // 🌗 Scaffold
    scaffoldBackgroundColor: AppColors.background,

    // font family
    fontFamily: "RobotoSlab",

    // 🎨 Color Scheme
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      error: AppColors.error,
      surface: AppColors.surface,
    ),

    // 🧭 AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.surface,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        fontFamily: "RobotoSlab",
      ),
    ),

    // ⏳ CircularProgressIndicator
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.loader,
    ),

    // 📝 TextField / Dropdown
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      hintStyle: const TextStyle(color: AppColors.textHint),
      labelStyle: const TextStyle(color: AppColors.textSecondary),
      errorStyle: const TextStyle(color: AppColors.error),

      contentPadding:  EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.divider),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.divider),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide:  BorderSide(color: AppColors.primary, width: 1.5.w),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.error),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide:  BorderSide(color: AppColors.error, width: 1.5.w),
      ),
    ),

    // 🧭 Bottom Navigation Bar
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surface,
      selectedItemColor: AppColors.bottomNavSelected,
      unselectedItemColor: AppColors.bottomNavUnselected,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),

    // 📑 Dropdown menu
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: const TextStyle(color: AppColors.textPrimary),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.surface),
        elevation: WidgetStateProperty.all(4),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    ),

    // 📄 Divider
    dividerTheme: const DividerThemeData(
      color: AppColors.divider,
      thickness: 1,
    ),
  );
}
