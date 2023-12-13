import 'package:expense_tracker/widgets/chart/chart.dart';
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
  final List<Expense> _registerdExpenses = [];
  void _openAddExpanse(){
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder:(ctx) => NewExpense( onExpense: addExpense,),
    );

/*    Navigator.of(context).push(MaterialPageRoute(builder:
        (context) => NewExpense( onExpense: addExpense))) ;*/
  }

  void addExpense(Expense expense){
  setState(() {
    _registerdExpenses.add(expense);
  });
  }
  void removeExpense(Expense expense){
    final expenseIndex = _registerdExpenses.indexOf(expense);
    setState(() {
      _registerdExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars(); //clear previors one and shows next
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
      duration: Duration(seconds: 3),
          content: Text('Expense Removed'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: (){
            setState(() {
              _registerdExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'
      ),
    );

    if(_registerdExpenses.isNotEmpty){
      mainContent = ExpensesList(expenses: _registerdExpenses, onExpenseRemoved: removeExpense,);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expense Tracker"),
        actions: [
          IconButton(onPressed: _openAddExpanse, icon: Icon(Icons.add))
        ],
      ),
      body: phoneWidth<600? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Chart(expenses: _registerdExpenses,),
          Expanded(
            child: mainContent
    )
    ],
      ) : Row(
        children: [
         Expanded(child: Chart(expenses: _registerdExpenses,)),
         Expanded(
            child: mainContent
        )
        ],),
    );
  }
}
