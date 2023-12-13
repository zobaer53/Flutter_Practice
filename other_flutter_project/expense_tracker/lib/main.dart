import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
var kColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
var kDardColorScheme = ColorScheme.fromSeed(brightness:Brightness.dark ,seedColor: const Color.fromARGB(255, 5, 9, 125));
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(useMaterial3: true,
          colorScheme: kDardColorScheme,
        cardTheme: CardTheme().copyWith(
          color: kDardColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kDardColorScheme.primaryContainer,
              foregroundColor: kDardColorScheme.onPrimaryContainer
            ),
          ),),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(useMaterial3: true,
          colorScheme: kColorScheme ,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer
        ),
        cardTheme: CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 18,
          )
        ),
      ),
      home: const Expenses(),
    );
  }
}
