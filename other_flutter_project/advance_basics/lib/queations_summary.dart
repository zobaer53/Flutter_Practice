import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary({super.key, required this.summaryData});

  List<Map<String, dynamic>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map(
        (data) {
          return Row(
            children: [
              Text("${(int.parse(data['question_index'].toString()) +1)}"),
             // Text(((data['question_index'] as Int) +1).toString()),
              Expanded(
                child: Column(
                  children: [
                 Text("${data['question']}"),
                    SizedBox(height: 5,),
                    Text("${data['user_answer']}"),
                    Text("${data['correct_answer']}"),
                  ],
                ),
              )
            ],);
        },
      ).toList(),
    );
  }
}
