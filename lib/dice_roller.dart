import 'dart:math';
import 'package:flutter/material.dart';
import 'package:simple_dice_roller/styled_text.dart';
import 'package:simple_dice_roller/dice_view.dart';

// Global Variables
final randomGenerator = Random();

// Widget
class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  var diceRoll = [1, 1, 1, 1, 1, 1];
  var diceCount = 1;
  var addButtonVisible = true;
  var removeButtonVisible = false;

  rollDice() {
    setState(() {
      for (int i = 0; i < diceCount; i++) {
        diceRoll[i] = randomGenerator.nextInt(6) + 1;
      }
    });
  }

  addDice() {
    if (diceCount < 6) {
      setState(() {
        diceCount++;
        updateButtonVisibility();
      });
    }
  }

  removeDice() {
    if (diceCount > 1) {
      setState(() {
        diceCount--;
        updateButtonVisibility();
      });
    }
  }

  updateButtonVisibility() {
    print(diceCount);
    if (diceCount > 1) {
      removeButtonVisible = true;
    } else {
      removeButtonVisible = false;
    }

    if (diceCount == 6) {
      addButtonVisible = false;
    } else {
      addButtonVisible = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: DiceView(diceCount, diceRoll),
        ),
        const SizedBox(
          height: 20.0,
        ),
        TextButton(
          onPressed: rollDice,
          child: const StyledText('Roll Dice!'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: addButtonVisible,
              maintainAnimation: true,
              maintainSize: true,
              maintainState: true,
              child: TextButton(
                onPressed: addDice,
                child: const StyledText('+1 Dice'),
              ),
            ),
            Visibility(
              visible: removeButtonVisible,
              maintainAnimation: true,
              maintainSize: true,
              maintainState: true,
              child: TextButton(
                onPressed: removeDice,
                child: const StyledText('-1 Dice'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
