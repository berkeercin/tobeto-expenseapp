import 'package:expenseapp/models/expense.dart';
import 'package:flutter/material.dart';

void main() {
  Expense expense =
      Expense(name: "Harcama 1", price: 500, date: DateTime.now());
  runApp(const MaterialApp(
    home: Scaffold(),
  ));
}


// modelleme

