import 'package:expenseapp/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {Key? key}) : super(key: key);
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(expense.name),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text("₺${expense.price.toStringAsFixed(2)}"),
                const Spacer(),
                Text(DateFormat.yMMMMEEEEd().format(expense.date))
              ],
            )
          ],
        ),
      ),
    );
  }
}
// y => yıl
// M => ay
// m => dakika
// H => 24 saat sisteminde saat
// h => 12 saat sisteminde saat
// d => gün
// s => saniye