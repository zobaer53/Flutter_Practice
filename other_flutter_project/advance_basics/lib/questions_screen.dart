import 'package:advance_basics/anser_button.dart';
import 'package:flutter/material.dart';
import 'package:advance_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/chatgpt_api.dart';

// Add a loading state to handle asynchronous calls
enum LoadingState {
  loading,
  loaded,
  error,
}

class QuestionsScreen extends StatefulWidget {
  QuestionsScreen(this.onSelectAnswer, {Key? key}) : super(key: key);

  final void Function(String answer) onSelectAnswer;
  final ChatGPTService chatGPTService = ChatGPTService(apiKey: 'api key');

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  LoadingState loadingState = LoadingState.loading;
  String generatedPrompt = '';

  @override
  void initState() {
    super.initState();
    loadPrompt();
  }

  Future<void> loadPrompt() async {
   // try {
      final selectedOption = questions[currentQuestionIndex].text; // Adjust as needed
      final prompt = await widget.chatGPTService.generatePrompt(selectedOption);
      setState(() {
        generatedPrompt = prompt;
        print(generatedPrompt);
        loadingState = LoadingState.loaded;
      });
   // } catch (e) {
      setState(() {
        loadingState = LoadingState.error;
      });
      //print('Error loading prompt: $e');
   // }
  }

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      if (currentQuestionIndex < questions.length) {
        currentQuestionIndex++;
        loadPrompt(); // Load the next prompt
      } else {
        // Handle the end of questions
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (loadingState == LoadingState.loading)
              CircularProgressIndicator()
            else if (loadingState == LoadingState.loaded)
              Text(
                generatedPrompt,
                style: GoogleFonts.lato(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              )
            else
              Text(
                'Error loading prompt',
                style: GoogleFonts.lato(color: Colors.red, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 20),
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffeledAnsers().map((answer) {
              return AnswerButton(answerText: answer, onTap: () {
                answerQuestion(answer);
              });
            }),
          ],
        ),
      ),
    );
  }
}


/*
class QuestionsScreen extends StatefulWidget {
   QuestionsScreen(this.onSelectAnswer, {super.key});

  final void Function(String answer) onSelectAnswer;
  final ChatGPTService chatGPTService = ChatGPTService(apiKey: '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');

  Future<void> onOptionSelected(String selectedOption) async {
    final generatedPrompt = await chatGPTService.generatePrompt(selectedOption);
    print(generatedPrompt); // Use the generated prompt as needed in your app
  }

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      if (currentQuestionIndex < questions.length) {
        currentQuestionIndex++;
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffeledAnsers().map((answer) {
              return AnswerButton(answerText: answer, onTap: (){
                answerQuestion(answer);
              });
            }),
          ],
        ),
      ),
    );
  }
}
*/
