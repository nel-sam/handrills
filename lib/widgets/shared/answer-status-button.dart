import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';

class AnswerStatusButton extends StatelessWidget {
  final bool isCorrect;

  const AnswerStatusButton({
    Key? key,
    required this.isCorrect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: this.isCorrect
          ? Icon(CORRECT_ANSWER_ICON, color: CORRECT_COLOR)
          : Icon(WRONG_ANSWER_ICON, color: WRONG_COLOR),
    );
  }
}
