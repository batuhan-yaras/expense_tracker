import 'package:flutter/material.dart';
import 'package:original_1/core/all_colors.dart';
import 'package:original_1/core/all_pics.dart';
import 'package:original_1/core/all_strings.dart';
import 'package:original_1/core/padding_settings.dart';
import 'package:original_1/core/themes/general_button.dart';
import 'package:original_1/core/themes/textField_theme.dart';
import 'package:original_1/product/firstpage/firstpage_widgets.dart';

class FirstPageWidget extends StatefulWidget {
  const FirstPageWidget({super.key});

  @override
  State<FirstPageWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<FirstPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: firstPageColors().fpBGColor,
        appBar: AppBar(
          title: Text(FirstPageStrings().firstAppBar),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(FirstPageImages().backgroundImage), fit: BoxFit.cover)),
          child: Padding(
            padding: AllPadings().generalPadding,
            child: Column(children: [
              const FirstPageTitle(),
              FirstPageTextField(
                borderColor: firstPageColors().fpTitleColor,
              ),
              GeneralButton(
                title: FirstPageStrings().firstButtonTitle,
                buttonTextColor: firstPageColors().fpButtonTextColor,
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const FirstPageTextField()));
                },
              ),
            ]),
          ),
        ));
  }
}
