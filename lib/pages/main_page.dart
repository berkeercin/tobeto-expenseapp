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
  late Expense removedExpense;
  late int indexNumber;
  List<Expense> expense = listExpenseItem();
  addExpense(Expense newExpense) {
    setState(() {
      expense.add(newExpense);
    });
  }

  removeExpense(int index, Expense newExpense) {
    setState(() {
      removedExpense = newExpense;
      indexNumber = index;
      expense.remove(newExpense);
    });
  }

  undoExpense() {
    setState(() {
      expense.insert(indexNumber, removedExpense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Expense App"),
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
      body: ExpensesPage(expenses, removeExpense, undoExpense),
    );
  }
}
