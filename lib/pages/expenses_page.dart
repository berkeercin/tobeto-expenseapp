// ignore_for_file: library_private_types_in_public_api

import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage(this.expenses, this.onRemove, this.onUndo, {Key? key})
      : super(key: key);
  final List<Expense> expenses;
  final void Function(int index, Expense expense) onRemove;
  final void Function() onUndo;

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Grafik bölümü"),
          const Spacer(),
          SizedBox(
            height: 400,
            child: ListView.builder(
              itemCount: widget.expenses.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey(widget.expenses[index]),
                  child: ExpenseItem(widget.expenses[index]),
                  onDismissed: (direction) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.black,
                      content: Text(
                          style: Theme.of(context).textTheme.bodyLarge,
                          "Başarı ile ${widget.expenses[index].name} silindi"),
                      action: SnackBarAction(
                          label: "Geri al",
                          textColor: Colors.white,
                          onPressed: () {
                            widget.onUndo();
                          }),
                    ));

                    widget.onRemove(index, widget.expenses[index]);
                  },
                );
              },
            ),
          ),
          const Spacer(),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
