import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

// id => indentifier => kimlik belirleyici
var uuid = const Uuid();

enum Category { work, travel, food, dress }

const categoryIcons = {
  Category.travel: Icons.travel_explore,
  Category.dress: Icons.shopping_bag,
  Category.work: Icons.work,
  Category.food: Icons.food_bank
};

class Expense {
  Expense(
      {required this.name,
      required this.price,
      required this.date,
      required this.category})
      : id = uuid.v4();
  final String id;
  final String name;
  final double price;
  final DateTime date;
  final Category category;
  // belirli kategoriler
  // enum
}

class CategoryExpenses {
  const CategoryExpenses({required this.category, required this.expenses});

  final Category category;
  final List<Expense> expenses;

  double get totalCategoryPrice {
    double sum = 0;
    for (var expense in expenses) {
      sum += expense.price;
    }

    return sum;
  }
}

// id,long =>1,2,3,4,5,99999999

// String => uuid/guid