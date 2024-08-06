import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/all_colors.dart';
import 'package:flutter_application_1/core/padding_settings.dart';

class FirstPageTextField extends StatelessWidget {
  const FirstPageTextField({super.key, this.borderColor, this.controller});
  final borderColor;
  final controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AllPadings().firstTextFieldPadding,
      child: TextField(
        controller: controller,
        cursorColor: firstPageColors().fpTextColor,
        style: TextStyle(color: firstPageColors().fpTextColor),
        maxLength: 20,
        autofocus: false,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: firstPageColors().fpTextColor, // Odaklanılmış kenarlık rengini beyaz yapar.
            ),
          ),
        ),
      ),
    );
  }
}
