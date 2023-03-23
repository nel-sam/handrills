import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';

class HintButton extends StatelessWidget {
  final String userInput;
  final String correctAnswer;

  const HintButton({
    Key? key,
    required this.userInput,
    required this.correctAnswer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "Hint: ${getHint(context)}",
      triggerMode: TooltipTriggerMode.tap,
      preferBelow: false,
      child: Icon(Icons.lightbulb_circle),
    );
  }

  String getHint(BuildContext context) {
    if (userInput == '') {
      return correctAnswer[0];
    } else {
      for (var i = 0; i < correctAnswer.length && i < userInput.length; i++) {
        if (correctAnswer[i] == userInput[i] && i < correctAnswer.length - 1) {
          return correctAnswer[i + 1];
        } else
          return correctAnswer[i];
      }
    }
    return "";
  }
}
