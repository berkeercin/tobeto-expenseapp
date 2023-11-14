import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  var _expenseNameController = TextEditingController();
  var _expensePriceControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: _expenseNameController,
              maxLength: 50,
              decoration: InputDecoration(labelText: "Harcama adı"),
            ),
            TextField(
              controller: _expensePriceControler,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Harcama miktarı"),
            ),
            ElevatedButton(
                onPressed: () {
                  print(
                      "Kaydedilen değer: ${_expenseNameController.text} ${_expensePriceControler.text}");
                },
                child: const Text("Ekle"))
          ],
        ),
      ),
    );
  }
}
