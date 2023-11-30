import 'package:advance_basics/quiz.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen( this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 238, 229, 229),
          ),
          const SizedBox(height: 80),
          Text("Learn flutter the fun way!", style: GoogleFonts.lato(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
              /*  onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const QuestionsScreen()));
              }*/
              onPressed: switchScreen,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.blueGrey),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('Start Quiz'))
        ],
      ),
    );
  }
}
