import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.onExpenseRemoved});

  final List<Expense> expenses;
  final void Function (Expense expense) onExpenseRemoved;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: expenses.length, itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index].id),
        background: Container(color: Theme.of(context).colorScheme.error.withOpacity(.75),
        margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal),
        ),
        onDismissed: (direction){
          onExpenseRemoved(expenses[index]);
        },
        child: ExpenseItem(expense: expenses[index])));
  }
}
