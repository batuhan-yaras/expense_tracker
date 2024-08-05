import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/all_colors.dart';
import 'package:flutter_application_1/core/all_strings.dart';
import 'package:flutter_application_1/core/padding_settings.dart';

//İlk sayfadaki başlığın widgetı
class FirstPageTitle extends StatelessWidget {
  const FirstPageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return eventNameTitle(context);
  }
}

// İlk Sayfadaki başlığın Text ayarları
Padding eventNameTitle(BuildContext context) {
  return Padding(
    padding: AllPadings().firstTitlePadding,
    child: Text(
      textAlign: TextAlign.center,
      FirstPageStrings().firstTitle,
      style: Theme.of(context).textTheme.displaySmall?.copyWith(color: firstPageColors().fpTitleColor),
    ),
  );
}
