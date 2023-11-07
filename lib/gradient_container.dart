import 'package:flutter/material.dart';
import 'package:roll_dice/dice_roller.dart';
import 'package:roll_dice/style_text.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
   GradientContainer(this.color1, this.color2, {super.key}); //constuctor
   GradientContainer.purple({super.key})
      : color1 = Colors.deepPurple,
        color2 = Colors.indigo;

  final Color color1;
  final Color color2;

  @override
  Widget build(context) {
    /*
    container is a widget is good for styling
    it contins decoration-> container shape
    */
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          /*
          for starting top to bottom
          */
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: Center(
          child: DiceRoller()
    ));
  }
}
