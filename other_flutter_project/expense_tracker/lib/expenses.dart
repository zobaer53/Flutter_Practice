
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/expense.dart';

class Expenses  extends StatefulWidget{
  const Expenses({super.key});


  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }

}

class _ExpensesState extends State<Expenses>{
  final List<Expense> _registerdExpenses = [
    Expense(title: 'Flutter Course', amount: 19.99, date:DateTime.now(), category: Category.work),
    Expense(title: 'Cinema', amount: 15.99, date:DateTime.now(), category: Category.leisure)
  ];

  @override
  Widget build(BuildContext context) {
  return const Scaffold(
    body: Column(
      children: [
        Text("charts"),
        Text("expense list")
      ],
    ),
  );
  }
}
