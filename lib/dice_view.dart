import 'package:flutter/material.dart';

class DiceView extends StatelessWidget {
  const DiceView(this.diceCount, this.diceRoll, {super.key});

  final int diceCount;
  final List<int> diceRoll;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(diceCount, (index) {
        return Image.asset(
          'assets/images/dice-${diceRoll[index]}.png',
          width: 200,
        );
      }),
    );
  }
}
