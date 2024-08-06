import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/all_colors.dart';
import 'package:flutter_application_1/core/all_strings.dart';
import 'package:flutter_application_1/core/padding_settings.dart';

Text addPersonTitle(BuildContext context, String index) {
  return Text(
    index,
    style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: SecondPageColors().secondTitle1Color),
  );
}

IconButton addButton(context) {
  return IconButton(
    focusColor: Colors.white,
    color: firstPageColors().fpTextColor,
    icon: const Icon(Icons.add),
    onPressed: context,
  );
}
