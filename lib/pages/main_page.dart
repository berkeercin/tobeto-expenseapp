// ignore_for_file: library_private_types_in_public_api

import 'package:expenseapp/pages/expenses_page.dart';
import 'package:expenseapp/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
                      return const NewExpense();
                    });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: const ExpensesPage(),
    );
  }
}
