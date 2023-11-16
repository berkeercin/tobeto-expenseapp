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
  Future<void> _showDatePicker(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime year = DateTime(now.year - 1, now.month, now.day);
    DateTime? selected = await showDatePicker(
        context: context, initialDate: now, firstDate: year, lastDate: now);
    setState(() {
      if (selected == null) {
        dateText = "Lütfen geçerli bir tarih giriniz";
      } else {
        String fixedDate = DateFormat.yMd().format(selected);
        dateText = fixedDate;
      }
    });
  }

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
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _expensePriceControler,
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: "Harcama miktarı"),
                  ),
                ),
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () async {
                      await _showDatePicker(context);
                    },
                    icon: const Icon(Icons.calendar_month)),
                Text(dateText),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text("Kapat")),
                ElevatedButton(
                    onPressed: () {
                      print(
                          "Kaydedilen değer: ${_expenseNameController.text} ${_expensePriceControler.text}, $dateText");
                    },
                    child: const Text("Ekle")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
