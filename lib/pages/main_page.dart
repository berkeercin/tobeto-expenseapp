import 'package:expenseapp/data/expense_data.dart';
import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/pages/expenses_page.dart';
import 'package:expenseapp/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int refreshNumber = 0;

  List<Expense> expense = listExpenseItem();
  ExpensesPage expensesPage = ExpensesPage(expenses);
  addExpense(Expense newExpense) {
    setState(() {
      expense.add(newExpense);
      expensesPage = ExpensesPage(expenses);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense App"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return NewExpense(addExpense);
                },
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: expensesPage,
    );
  }
}
