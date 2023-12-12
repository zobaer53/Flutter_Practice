
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget{
  ExpenseItem({required this.expense,super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {

    return Card(
      child:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,
            vertical: 16),
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.start ,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
          Text("${expense.title.characters.first.toUpperCase()}${expense.title.substring(1,expense.title.length)}"),
          SizedBox(height: 4,),
          Row( 
            children:[
            Text("\$${expense.amount.toStringAsFixed(2)}"),
              Spacer(),
              Row(
                children: [
                  Icon(categoryIcons[expense.category]),
                  SizedBox(width: 4,),
                  Text(" ${expense.formattedDate}"),],
              )
          ],)],
        )
      ),
    );
  }
}