// ignore_for_file: library_private_types_in_public_api

import 'package:expenseapp/data/expense_data.dart';
import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage(this.refresh, {Key? key}) : super(key: key);

  final int refresh;

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  List<Expense> listExpense = listExpenseItem();

  @override
  Widget build(BuildContext context) {
    if (widget.refresh >= 0) {
      listExpense = listExpenseItem();
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Grafik bölümü"),
          SizedBox(
            height: 400,
            child: ListView.builder(
              itemCount: listExpense.length,
              itemBuilder: (context, index) {
                return ExpenseItem(listExpense[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
