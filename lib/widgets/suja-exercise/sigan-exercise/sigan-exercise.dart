import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/state/models/sigan-exercise-state.dart';
import 'package:handrills/widgets/suja-exercise/sigan-exercise/clock.dart';

class SiganExercise extends StatefulWidget {
  final SiganExerciseState siganExerciseState;
  final Function(String) onUserHourSet;

  const SiganExercise({
    Key? key,
    required this.siganExerciseState,
    required this.onUserHourSet,
  }) : super(key: key);

  @override
  _SiganExerciseState createState() => _SiganExerciseState();
}

OutlineInputBorder getBorder(String correct, String userInput) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: correct == userInput ? CORRECT_COLOR : WRONG_COLOR,
    ),
  );
}

class _SiganExerciseState extends State<SiganExercise> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Clock(
            time:
                '${widget.siganExerciseState.hour}:$widget.siganExerciseState.min:$widget.siganExerciseState.sec'),
        Row(
          children: [
            Container(
                width: 40,
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(4, 18, 0, 1),
                    enabledBorder: getBorder(
                        widget.siganExerciseState.correctHour,
                        widget.siganExerciseState.userHour),
                    focusedBorder: getBorder(
                        widget.siganExerciseState.correctHour,
                        widget.siganExerciseState.userHour),
                  ),
                  onChanged: (String? newVal) {
                    if (newVal != null) {
                      setState(() {
                        widget.onUserHourSet(newVal);
                      });
                    }
                  },
                )),
            Text('시'),
          ],
        ),
      ],
    );
  }
}
