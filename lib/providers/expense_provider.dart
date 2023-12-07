import 'package:expenseapp/models/expense.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

late Expense removedExpense;
late int removedIndex;

class ExpenseNotifier extends StateNotifier<List<Expense>> {
  ExpenseNotifier() : super([]);

  void addExpense(Expense expense) {
    if (!state.contains(expense)) {
      state = [...state, expense];
    }
  }

  void removeExpense(int index, Expense expense) {
    removedExpense = expense;
    removedIndex = index;
    state = state.where((element) => element.id != expense.id).toList();
  }

  void undoExpense() {
    state = List.from(state)..insert(removedIndex, removedExpense);
  }
}

final expenseProvider =
    StateNotifierProvider<ExpenseNotifier, List<Expense>>((ref) {
  return ExpenseNotifier();
});
