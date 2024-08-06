import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/all_colors.dart';

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

class CalculatedAlert {
  static void showCalculatedScreen(BuildContext context, double total) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Calculated Screen'),
          content: Text('Total: ${total.toStringAsFixed(2)}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dialogu kapatır
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
