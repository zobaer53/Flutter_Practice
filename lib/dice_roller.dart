import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 1;
  void roleDice() {
    setState(() {
      currentDiceRoll = Random().nextInt(6) + 1;
    });

    print('changing img...');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/dice-images/dice-$currentDiceRoll.png",
          width: 200,
        ),
        TextButton(
            onPressed: roleDice,
            style: TextButton.styleFrom(
                padding: const EdgeInsets.all(20), foregroundColor: Colors.white, textStyle: const TextStyle(fontSize: 28)),
            child: const Text('Roll Dice'))
      ],
    );
  }
}
