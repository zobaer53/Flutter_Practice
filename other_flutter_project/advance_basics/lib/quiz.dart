import 'package:advance_basics/data/questions.dart';
import 'package:advance_basics/questions_screen.dart';
import 'package:advance_basics/result_screen.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = "start-screen";
   List<String> selectedAnswer = [];


  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }
  void choseAnswers(String answer){
    selectedAnswer.add(answer);
    if(selectedAnswer.length == questions.length){
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
   Widget screenWidget =StartScreen(switchScreen);

   if(activeScreen == 'questions-screen'){
     screenWidget =  QuestionsScreen( choseAnswers,);
   }else if(activeScreen == "result-screen" ){
     screenWidget = ResultScreen( chosenAnswers: selectedAnswer,);
   }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.deepPurple,
                  Colors.indigo,
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: screenWidget,
          )),
    );
  }
}
