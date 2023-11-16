// ignore_for_file: library_private_types_in_public_api

import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({Key? key}) : super(key: key);

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  List<Expense> expenses = [
    Expense(
        name: "Yemek",
        price: 500.22,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        name: "Udemy kursu",
        price: 200.00,
        date: DateTime.now(),
        category: Category.work),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Grafik bölümü"),
          SizedBox(
            height: 400,
            child: ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (context, index) {
                  return ExpenseItem(expenses[index]);
                }),
          ),
        ],
      ),
    );
  }
}
