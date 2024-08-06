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
    color: firstPageColors().fpTextColor,
    icon: const Icon(Icons.add),
    onPressed: context,
  );
}

class CalculatedAlert {
  static void showCalculatedScreen(
      BuildContext context, double total, List<String> persons, Map<String, List<double>> expenses) {
    Map<String, double> totalExpenses = {};

    // Kişi başına toplam harcamayı hesaplayın
    for (var person in persons) {
      totalExpenses[person] = expenses[person]?.fold(0.0, (sum, expense) => sum! + expense) ?? 0.0;
    }

    // Ortalama harcamayı hesaplayın
    double averageExpense = total / persons.length;

    // Borç hesaplamalarını yapın
    Map<String, double> balances = {};
    for (var person in persons) {
      balances[person] = totalExpenses[person]! - averageExpense;
    }

    List<String> debtMessages = [];

    for (var debtor in persons) {
      for (var creditor in persons) {
        if (debtor != creditor && balances[debtor]! < 0 && balances[creditor]! > 0) {
          double debtAmount = balances[creditor]! < -balances[debtor]! ? balances[creditor]! : -balances[debtor]!;
          if (debtAmount > 0) {
            debtMessages.add('$debtor needs to pay $creditor ${debtAmount.toStringAsFixed(2)} TL');
            balances[debtor] = balances[debtor]! + debtAmount;
            balances[creditor] = balances[creditor]! - debtAmount;
          }
        }
      }
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            SecondPageStrings().calculatedTitle,
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
                'Total Expenses: ${total.toStringAsFixed(2)} TL',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: SecondPageColors().totalExpensesColor),
              ),
              const SizedBox(height: 16),
              ...debtMessages.map((msg) => Padding(
                    padding: AllPadings().smallVerticalPadding,
                    child: Text(
                      msg,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: SecondPageColors().subtitleColor),
                    ),
                  )),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dialogu kapatır
              },
              child: Text(
                'Close',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.deepPurple),
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          backgroundColor: Colors.white,
          elevation: 10.0,
        );
      },
    );
  }
}
