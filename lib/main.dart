import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/themes/app_bar_theme.dart';
import 'package:flutter_application_1/firstpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expanse Tracker',
      theme: ThemeData(buttonTheme: const ButtonThemeData()).copyWith(
        appBarTheme: allAppBar(),
      ),
      home: const FirstPageWidget(),
    );
  }
}
