import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/lang_data/dongsa.dart';
import 'package:handrills/widgets/shared/hd-text.dart';
import 'package:handrills/widgets/shared/question-free-form.dart';

class VerbInput extends StatefulWidget {
  VerbInput({
    Key? key,
    required this.dongsa,
    required this.label,
    required this.correctValue,
  }) : super(key: key);

  final Dongsa dongsa;
  final String label;
  final String correctValue;

  @override
  State<VerbInput> createState() => _VerbInputState();
}

class _VerbInputState extends State<VerbInput> {
  String activeValue = '';

  @override
  Widget build(BuildContext context) {
    var isCorrect = activeValue == widget.correctValue;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              HDText(widget.label),
            ],
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: QuestionFreeForm(
                activeValue: activeValue,
                hintValue: widget.dongsa.infinitive,
                correctValues: [widget.correctValue],
                onChanged: (String newValue) {
                  setState(() {
                    activeValue = newValue;
                  });
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
