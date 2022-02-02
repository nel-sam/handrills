import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/lang_data/dongsa.dart';
import 'package:handrills/widgets/shared/hd-text.dart';
import 'package:handrills/widgets/shared/question-free-form.dart';

class VerbInput extends StatelessWidget {
  const VerbInput({
    Key? key,
    required this.dongsa,
    required this.label,
    required this.correctValue,
    required this.activeValue,
    required this.onChanged,
  }) : super(key: key);

  final Dongsa dongsa;
  final String label;
  final String correctValue;
  final String activeValue;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    var isCorrect = activeValue == correctValue;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: HDText(
            label,
            textAlign: TextAlign.end,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: QuestionFreeForm(
                activeValue: activeValue,
                hintValue: dongsa.infinitive,
                correctValues: [correctValue],
                onChanged: (String newValue) {
                  onChanged(newValue);
                },
              ),
            ),
            isCorrect
                ? Icon(
                    CORRECT_ANSWER_ICON,
                    color: CORRECT_COLOR,
                  )
                : Icon(
                    Icons.circle_outlined,
                    color: Colors.grey,
                  ),
          ],
        ),
      ],
    );
  }
}
