import 'package:flutter/material.dart';

class CountExerciseState {
  final IconData icon;
  final String Function(BuildContext context) getLabel;
  final int count;
  final String correctAnswer;
  final String counter;
  final bool isSino;
  String userInput = '';

  CountExerciseState({
    required this.icon,
    required this.getLabel,
    required this.isSino,
    required this.count,
    required this.counter,
    required this.correctAnswer,
  });

  bool getIsCorrect() {
    return this.userInput == this.correctAnswer;
  }
}
