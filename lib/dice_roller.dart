import 'dart:math';
import 'package:flutter/material.dart';
import 'package:simple_dice_roller/styled_text.dart';

// Global Variables
final randomGenerator = Random();

// Widget
class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  var diceRoll = 1;

  rollDice() {
    setState(() {
      diceRoll = randomGenerator.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/dice-$diceRoll.png',
              width: 200,
            ),
            const SizedBox(height: 20.0,),
            TextButton(
              onPressed: rollDice,
              child: const StyledText('Roll Dice!'),
            ),
          ],
        );
  }
}