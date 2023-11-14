import 'package:uuid/uuid.dart';

// id => indentifier => kimlik belirleyici
var uuid = const Uuid();

class Expense {
  Expense({required this.name, required this.price, required this.date})
      : id = uuid.v4();
  final String id;
  final String name;
  final double price;
  final DateTime date;
}

// id,long =>1,2,3,4,5,99999999

// String => uuid/guid