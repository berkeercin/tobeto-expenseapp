import 'package:uuid/uuid.dart';

// id => indentifier => kimlik belirleyici

class Expense {
  Expense({required this.name, required this.price, required this.date});
  final String id;
  final String name;
  final int price;
  final DateTime date;
}

// id =>1,2,3,4,5

// String => uuid/guid