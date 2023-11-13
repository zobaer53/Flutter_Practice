import 'package:advance_basics/home_page.dart';
import 'package:advance_basics/quiz.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Quiz());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
     //   child: const StartScreen()
      )),
    );
  }
}
