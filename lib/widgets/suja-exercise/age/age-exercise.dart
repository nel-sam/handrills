import 'package:flutter/material.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:handrills/state/models/age-exercise-state.dart';
import 'package:handrills/widgets/shared/answer-status-button.dart';
import 'package:handrills/widgets/shared/next-button.dart';

class AgeExercise extends StatefulWidget {
  final AgeExerciseState state;
  final Function onAgeSet;
  final Function() onNextButtonPressed;

  const AgeExercise({
    Key? key,
    required this.state,
    required this.onAgeSet,
    required this.onNextButtonPressed,
  }) : super(key: key);

  @override
  _AgeExerciseState createState() => _AgeExerciseState();
}

class _AgeExerciseState extends State<AgeExercise> {
  @override
  Widget build(BuildContext context) {
    var isCorrect = this.widget.state.getIsCorrect();

    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('몇 살이에요?', style: TextStyle(fontSize: 20)),
          Text(widget.state.age.toString(), style: TextStyle(fontSize: 24)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnswerStatusButton(isCorrect: isCorrect),
              Container(
                width: 150,
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(4, 18, 0, 1),
                    enabledBorder: HD.getTextFieldBorder(isCorrect),
                    focusedBorder: HD.getTextFieldBorder(isCorrect),
                  ),
                  onChanged: (String? newVal) {
                    if (newVal != null) {
                      setState(() {
                        widget.onAgeSet(widget.state, newVal);
                      });
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('살', style: TextStyle(fontSize: 28)),
              ),
            ],
          ),
          NextButton(
            enabled: widget.state.getIsCorrect(),
            onPressed: widget.onNextButtonPressed,
          ),
        ],
      ),
    );
  }
}
