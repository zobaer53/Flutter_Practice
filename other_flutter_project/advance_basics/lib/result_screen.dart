import 'package:advance_basics/data/questions.dart';
import 'package:advance_basics/home_page.dart';
import 'package:advance_basics/queations_summary.dart';
import 'package:advance_basics/quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
           crossAxisAlignment: CrossAxisAlignment.center,
     children: [
        Text("You answered $numTotalQuestions out of $numCorrectQuestions questions correctly",
            style: GoogleFonts.lato(
                color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,),

           SizedBox(height:30,),
      QuestionsSummary(summaryData: getSummaryData()),
       const SizedBox(height: 30,),

       GestureDetector(
         onTap: () {
           Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Quiz()));
         },
         child: Row(
           mainAxisAlignment: MainAxisAlignment.center,// Wrap icon and Text in a Row
           children: [
             Icon(Icons.restart_alt_outlined, color: Colors.white),
             SizedBox(width: 8), // Add some spacing between icon and text
             Text(
               'Restart Text',
               style: GoogleFonts.lato(
                 color: Colors.white,
                 fontSize: 18,
                 fontWeight: FontWeight.bold,
               ),
             ),
           ],
         ),
       ),
     ],
   ),
    ),
   );
  }
}
