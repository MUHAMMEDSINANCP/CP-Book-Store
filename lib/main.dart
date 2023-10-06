import 'package:cp_book_store/common/color_extension.dart';
import 'package:cp_book_store/view/main_tab/main_tab_view.dart';
import 'package:flutter/material.dart';

import 'view/onboarding/onboarding_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CP Book Store',
      theme: ThemeData(
        primaryColor: TColor.primary,
        fontFamily: 'SF Pro Text',
      ),
      home: const OnboardingView(),
    );
  }
}
