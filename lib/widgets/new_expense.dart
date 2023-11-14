// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _expenseNameController = TextEditingController();
  final _expensePriceControler = TextEditingController();
  String dateText = "Tarih seçiniz";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _expenseNameController,
              maxLength: 50,
              decoration: const InputDecoration(labelText: "Harcama adı"),
            ),
            TextField(
              controller: _expensePriceControler,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Harcama miktarı"),
            ),
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () async {
                  DateTime now = DateTime.now();
                  DateTime year = checkDate();
                  DateTime? selected = await showDatePicker(
                      context: context,
                      initialDate: now,
                      firstDate: year,
                      lastDate: now);
                  setState(() {
                    if (selected == null) {
                      dateText = "Lütfen geçerli bir tarih giriniz";
                    } else {
                      DateTime originalDate = selected;
                      String fixedDate = DateFormat.yMd().format(originalDate);
                      dateText = fixedDate;
                    }
                  });
                },
                icon: const Icon(Icons.calendar_month)),
            Text(dateText),
            ElevatedButton(
                onPressed: () {
                  print(
                      "Kaydedilen değer: ${_expenseNameController.text} ${_expensePriceControler.text}, $dateText");
                },
                child: const Text("Ekle"))
          ],
        ),
      ),
    );
  }
}

DateTime checkDate() {
  final now = DateTime.now();
  final yearAgo = now.add(const Duration(days: -365, hours: -6));

  return yearAgo;
}
