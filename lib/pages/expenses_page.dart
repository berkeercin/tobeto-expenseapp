// ignore_for_file: library_private_types_in_public_api

import 'package:expenseapp/data/expense_data.dart';
import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/chart.dart';
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
          Expanded(
            child: SizedBox(
                height: 280,
                child: Chart(
                  allExpenses: expenses,
                )),
          ),
          Expanded(
            child: SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: widget.expenses.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: ValueKey(widget.expenses[index]),
                    child: ExpenseItem(widget.expenses[index]),
                    onDismissed: (direction) {
                      ScaffoldMessenger.of(context).clearSnackBars();
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
          ),
          Expanded(
            child: const SizedBox(
              height: 1,
            ),
          )
        ],
      ),
    );
  }
}
