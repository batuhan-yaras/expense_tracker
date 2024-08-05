import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/all_colors.dart';

class GeneralButton extends StatelessWidget {
  const GeneralButton({super.key, required this.title, required this.onPressed, this.buttonTextColor});
  final String title;
  final VoidCallback onPressed;
  final buttonTextColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 150,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: firstPageColors().fpTextColor,
            elevation: 4,
            foregroundColor: buttonTextColor,
            textStyle: const TextStyle(letterSpacing: 1, fontWeight: FontWeight.w500)),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
