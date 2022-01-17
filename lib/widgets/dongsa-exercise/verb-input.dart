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
  late String activeValue = '';

  @override
  State<VerbInput> createState() => _VerbInputState();
}

class _VerbInputState extends State<VerbInput> {
  @override
  Widget build(BuildContext context) {
    var isCorrect = widget.activeValue == widget.correctValue;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HDText(widget.label),
        Row(
          children: [
            QuestionFreeForm(
              activeValue: widget.activeValue,
              hintValue: widget.dongsa.infinitive,
              correctValues: [widget.correctValue],
              onChanged: (String newValue) {
                setState(() {
                  widget.activeValue = newValue;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                isCorrect ? CORRECT_ANSWER_ICON : Icons.circle_outlined,
                color: isCorrect ? CORRECT_COLOR : Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
