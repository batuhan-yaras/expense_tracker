import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/all_strings.dart';
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
      debugShowCheckedModeBanner: false,
      title: appStrings().mainTitle,
      theme: ThemeData(buttonTheme: const ButtonThemeData()).copyWith(
        appBarTheme: allAppBar(),
      ),
      home: const FirstPageWidget(),
    );
  }
}
