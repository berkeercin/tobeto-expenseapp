// ignore_for_file: library_private_types_in_public_api

import 'package:expenseapp/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({Key? key}) : super(key: key);

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  List<Expense> expenses = [
    Expense(name: "Yemek", price: 500, date: DateTime.now()),
    Expense(name: "Udemy kursu", price: 200, date: DateTime.now()),
    Expense(name: "Yemek", price: 500, date: DateTime.now()),
    Expense(name: "Udemy kursu", price: 200, date: DateTime.now()),
    Expense(name: "Yemek", price: 500, date: DateTime.now()),
    Expense(name: "Udemy kursu", price: 200, date: DateTime.now()),
    Expense(name: "Yemek", price: 500, date: DateTime.now()),
    Expense(name: "Udemy kursu", price: 200, date: DateTime.now()),
    Expense(name: "Yemek", price: 500, date: DateTime.now()),
    Expense(name: "Udemy kursu", price: 200, date: DateTime.now()),
    Expense(name: "Yemek", price: 500, date: DateTime.now()),
    Expense(name: "Udemy kursu", price: 200, date: DateTime.now()),
    Expense(name: "Yemek", price: 500, date: DateTime.now()),
    Expense(name: "Udemy kursu", price: 200, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("ExpenseApp"),
            FloatingActionButton(
              backgroundColor: Colors.transparent,
              elevation: 0,
              onPressed: () {},
              child: const Icon(Icons.add),
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Grafik bölümü"),
            SizedBox(
              height: 400,
              child: ListView.builder(
                  itemCount: expenses.length,
                  itemBuilder: (context, index) {
                    return Text(expenses[index].name);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
