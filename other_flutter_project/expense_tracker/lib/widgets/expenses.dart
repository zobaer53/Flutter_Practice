import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerdExpenses = [
    Expense(title: 'Flutter Course',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(title: 'Cinema',
        amount: 15.99, date: DateTime.now(), category: Category.leisure)
  ];
  void _openAddExpanse(){
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder:(ctx) => NewExpense( onExpense: addExpense,),
    );
  }

  void addExpense(Expense expense){
  setState(() {
    _registerdExpenses.add(expense);
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expense Tracker"),
        actions: [
          IconButton(onPressed: _openAddExpanse, icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16),
          child: Text("Charts"),
        ), Expanded(child: ExpensesList(expenses: _registerdExpenses))],
      ),
    );
  }
}
