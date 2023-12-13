import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onExpense});

  final void Function(Expense expense) onExpense;

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _selectedDropDownMenuItem(Category value){
    setState(() {
      _selectedCategory = value;
    });
  }

  void _pressentDatePicker() async {
    final now = DateTime.now();
    final firtDate = DateTime(now.year - 1, now.month, now.day);
    var pickedDate = await showDatePicker(context: context, initialDate: now, firstDate: firtDate, lastDate: now);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData(){
    final enteredAmount = double.tryParse(_amountController.text);
    if(_titleController.text.trim().isEmpty || enteredAmount == null || enteredAmount <= 0.0 || _selectedDate == null){
      showDialog(context: context, builder:(ctx)=> AlertDialog(title: const Text('Invalid Input'),
        content: const Text('Please make sure a valid title, amount, date and category was entered. '),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(ctx);
          }, child: const Text('Okay'))
        ],
      )
      );
      return;
    }else{
      widget.onExpense(Expense(title: _titleController.text, amount: enteredAmount, date: _selectedDate!, category: _selectedCategory));
    Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
        padding: EdgeInsets.fromLTRB(16,48,16,keyboardSpace + 16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: InputDecoration(label: Text("Title")),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _amountController,
                    maxLength: 10,
                    decoration: InputDecoration(prefixText: '\$ ', label: Text('Amount')),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(_selectedDate == null ? 'No Date Selected' : formatter.format(_selectedDate!)),
                      IconButton(
                          onPressed: () {
                            _pressentDatePicker();
                          },
                          icon: Icon(Icons.calendar_month))
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DropdownButton(
                  value: _selectedCategory,
                    items: Category.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toUpperCase()),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if(value!= null){
                      _selectedDropDownMenuItem(value);}
                    }),

                Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel')
                ),
                ElevatedButton(onPressed: _submitExpenseData, child: Text('Save Expenses')
                )
              ],
            )
          ],
        ),
      );
  }
}
