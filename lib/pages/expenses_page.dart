// ignore_for_file: library_private_types_in_public_api

import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/providers/expense_provider.dart';
import 'package:expenseapp/widgets/chart.dart';
import 'package:expenseapp/widgets/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpensesPage extends ConsumerStatefulWidget {
  const ExpensesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends ConsumerState<ExpensesPage> {
  @override
  Widget build(BuildContext context) {
    List<Expense> expenses = ref.watch(expenseProvider);
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
                itemCount: expenses.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: ValueKey(expenses[index]),
                    child: ExpenseItem(expenses[index]),
                    onDismissed: (direction) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.black,
                        content: Text(
                            style: Theme.of(context).textTheme.bodyLarge,
                            "Başarı ile ${expenses[index].name} silindi"),
                        action: SnackBarAction(
                            label: "Geri al",
                            textColor: Colors.white,
                            onPressed: () {
                              ref.read(expenseProvider.notifier).undoExpense();
                            }),
                      ));

                      ref
                          .read(expenseProvider.notifier)
                          .removeExpense(index, expenses[index]);
                    },
                  );
                },
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(
              height: 1,
            ),
          )
        ],
      ),
    );
  }
}
