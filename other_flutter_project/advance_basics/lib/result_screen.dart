import 'package:advance_basics/data/questions.dart';
import 'package:advance_basics/queations_summary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String,dynamic>> getSummaryData(){

    final List<Map<String,dynamic>> summary = [];
    for(var i = 0; i <chosenAnswers.length; i++ ){
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

   return SizedBox(
       width: double.infinity,
       child: Container(
       margin: const EdgeInsets.all(40),
         child:  Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.stretch,
     children: [
        Text("You answered $numTotalQuestions out of $numCorrectQuestions questions correctly! ,"),
           SizedBox(height:30,),
      QuestionsSummary(summaryData: getSummaryData()),
       const SizedBox(height: 30,),
         TextButton(
           onPressed: () {},
         child: const Text('Restart Text'),)
     ],
   ),
    ),
   );
  }
}
