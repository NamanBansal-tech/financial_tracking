import 'package:finance_tracking/screens/home/home_page.dart';
import 'package:finance_tracking/utils/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, _) {
          return MaterialApp(
            theme: AppThemeData.lightTheme,
            home: HomePage(),
          );
        },
      ),
    );
  }
}
