import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/all_colors.dart';

AppBarTheme allAppBar() {
  return AppBarTheme(
    foregroundColor: firstPageColors().fpAppBarColor,
    backgroundColor: firstPageColors().fpBGColor,
    systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.black),
  );
}
