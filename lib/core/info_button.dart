import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/all_colors.dart';
import 'package:flutter_application_1/core/all_strings.dart';
import 'package:flutter_application_1/core/padding_settings.dart';

class InfoButton extends StatelessWidget {
  const InfoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.info_outline,
        color: firstPageColors().fpAppBarColor,
        size: 30,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                InfoButtonStrings().infoTitle,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold, color: SecondPageColors().calculatedTitleColor),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    InfoButtonStrings().infoSubtitle,
                    style:
                        Theme.of(context).textTheme.bodyLarge?.copyWith(color: SecondPageColors().totalExpensesColor),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: AllPadings().horizontalPadding,
                    child: Text(InfoButtonStrings().informationString),
                  ),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(InfoButtonStrings().infoOK))
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              backgroundColor: Colors.white,
              elevation: 10,
            );
          },
        );
      },
    );
  }
}
