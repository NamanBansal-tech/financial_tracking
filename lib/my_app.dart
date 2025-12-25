import 'package:finance_tracking/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        home: HomePage(),
      ),
    );
  }
}
