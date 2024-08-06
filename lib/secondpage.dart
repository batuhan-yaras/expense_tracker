import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/all_colors.dart';
import 'package:flutter_application_1/core/all_pics.dart';
import 'package:flutter_application_1/core/all_strings.dart';
import 'package:flutter_application_1/core/padding_settings.dart';
import 'package:flutter_application_1/core/themes/general_button.dart';
import 'package:flutter_application_1/core/themes/textField_theme.dart';
import 'package:flutter_application_1/firstpage.dart';
import 'package:flutter_application_1/product/secondpage_widgets.dart';

class SecondPageWidget extends StatefulWidget {
  const SecondPageWidget({super.key});

  @override
  State<SecondPageWidget> createState() => _SecondPageWidgetState();
}

class _SecondPageWidgetState extends State<SecondPageWidget> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _persons = [];
  final Map<String, List<double>> _expenses = {};

  void _addItem() {
    setState(() {
      _persons.add(_controller.text);
      _controller.clear();
      _expenses[_controller.text] = [];
    });
  }

  void _showExpenseScreen(String item) {
    TextEditingController expenseController = TextEditingController();

    double calculateTotalExpenses(String item) {
      List<double> expensesList = _expenses[item] ?? [];
      return expensesList.fold(0.0, (sum, expense) => sum + expense);
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Expense for $item'),
          content: TextField(
            controller: expenseController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: SecondPageStrings().expenseTitle),
          ),
          actions: [
            Row(
              children: [
                Text(
                  'Expenses: ${calculateTotalExpenses(item).toStringAsFixed(2)} TL',
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: AllPadings().largeRightPadding,
                  child: resetButton(expenseController, item, context),
                ),
                cancelButton(context),
                TextButton(
                  child: Text(SecondPageStrings().addbuttonTitle),
                  onPressed: () {
                    setState(() {
                      double expense = double.tryParse(expenseController.text) ?? 0.0;
                      if (_expenses[item] == null) {
                        _expenses[item] = [];
                      }
                      _expenses[item]?.add(expense);
                      total += expense;
                      expenseController.clear();
                    });
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  TextButton cancelButton(BuildContext context) {
    return TextButton(
      child: Text(SecondPageStrings().cancelTitle),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  TextButton resetButton(TextEditingController expenseController, String item, BuildContext context) {
    return TextButton(
      child: Text(SecondPageStrings().resetButton),
      onPressed: () {
        setState(() {
          if (_expenses[item] != null) {
            total -= (_expenses[item]?.fold(0.0, (sum, expense) => sum! + expense) ?? 0.0);
            _expenses[item] = [];
          }
          Navigator.of(context).pop();
        });
      },
    );
  }

  double total = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(FirstPageStrings().firstAppBar),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(FirstPageImages().backgroundImage), fit: BoxFit.cover)),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.black.withOpacity(0.1), // Opsiyonel: Opaklık ayarı
            ),
          ),
          Padding(
            padding: AllPadings().generalPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: AllPadings().topPadding + AllPadings().leftPadding,
                  child: addPersonTitle(context, SecondPageStrings().secondTitle1),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: AllPadings().verticalPadding + AllPadings().horizontalPadding,
                        child: FirstPageTextField(
                          label: 'Name',
                          borderColor: SecondPageColors().secondTitle1Color,
                          controller: _controller,
                        ),
                      ),
                    ),
                    Padding(
                      padding: AllPadings().bottomPadding,
                      child: addButton(_addItem),
                    ),
                  ],
                ),
                Divider(color: firstPageColors().fpTextColor),
                Padding(
                  padding: AllPadings().topPadding + AllPadings().bottomPadding,
                  child: addPersonTitle(context, secondTitle2),
                ),
                Expanded(
                  child: ListView(
                    primary: false,
                    children: _persons.map((item) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: AllPadings().leftPadding,
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: firstPageColors().fpTextColor, width: 2.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  padding: AllPadings().horizontalPadding,
                                ),
                                child: Text(
                                  item,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(color: firstPageColors().fpTextColor),
                                ),
                                onPressed: () {
                                  _showExpenseScreen(item);
                                }),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: GeneralButton(
                    title: SecondPageStrings().calculateButtonTitle,
                    onPressed: () {
                      CalculatedAlert.showCalculatedScreen(context, total, _persons, _expenses);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
