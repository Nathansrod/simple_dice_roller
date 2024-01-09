import 'package:flutter/material.dart';
import 'package:simple_dice_roller/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer([Color.fromARGB(255, 21, 162, 49), Color.fromARGB(255, 0, 0, 0)]), 
      ),
    ),
  );
}


