import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/all_colors.dart';
import 'package:flutter_application_1/core/all_pics.dart';
import 'package:flutter_application_1/core/all_strings.dart';
import 'package:flutter_application_1/core/info_button.dart';
import 'package:flutter_application_1/core/padding_settings.dart';
import 'package:flutter_application_1/core/themes/general_button.dart';
import 'package:flutter_application_1/core/themes/textField_theme.dart';
import 'package:flutter_application_1/product/firstpage_widgets.dart';
import 'package:flutter_application_1/secondpage.dart';

class FirstPageWidget extends StatefulWidget {
  const FirstPageWidget({super.key});

  @override
  State<FirstPageWidget> createState() => _MainWidgetState();
}

String eventName = '';
final TextEditingController _controller = TextEditingController();
String get secondTitle2 => 'Persons - $eventName';

class _MainWidgetState extends State<FirstPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: firstPageColors().fpBGColor,
        appBar: AppBar(
          actions: const [InfoButton()],
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
                label: 'Event Name',
                borderColor: firstPageColors().fpTitleColor,
                controller: _controller,
              ),
              GeneralButton(
                title: FirstPageStrings().firstButtonTitle,
                buttonTextColor: firstPageColors().fpButtonTextColor,
                onPressed: () {
                  setState(() {
                    eventName = _controller.text;
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondPageWidget()));
                },
              ),
            ]),
          ),
        ));
  }
}
