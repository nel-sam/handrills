import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/state/models/sigan-exercise-state.dart';
import 'package:handrills/widgets/suja-exercise/sigan-exercise/clock.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SiganExercise extends StatefulWidget {
  final SiganExerciseState siganExerciseState;
  final Function(SiganExerciseState, String) onUserHourSet;
  final Function(SiganExerciseState, String) onUserMinSet;
  final Function(SiganExerciseState, String) onUserSecSet;

  const SiganExercise({
    Key? key,
    required this.siganExerciseState,
    required this.onUserHourSet,
    required this.onUserMinSet,
    required this.onUserSecSet,
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
  final double textFieldWidth = 70;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Clock(
            time:
                '${widget.siganExerciseState.hour}:${widget.siganExerciseState.min}:${widget.siganExerciseState.sec}'),
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Text(AppLocalizations.of(context)!.typeTheTime),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Container(
                      width: textFieldWidth,
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
                              widget.onUserHourSet(
                                  widget.siganExerciseState, newVal);
                            });
                          }
                        },
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('시'),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      width: textFieldWidth,
                      child: TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.fromLTRB(4, 18, 0, 1),
                          enabledBorder: getBorder(
                              widget.siganExerciseState.correctMin,
                              widget.siganExerciseState.userMin),
                          focusedBorder: getBorder(
                              widget.siganExerciseState.correctMin,
                              widget.siganExerciseState.userMin),
                        ),
                        onChanged: (String? newVal) {
                          if (newVal != null) {
                            setState(() {
                              widget.onUserMinSet(
                                  widget.siganExerciseState, newVal);
                            });
                          }
                        },
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('분'),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      width: textFieldWidth,
                      child: TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.fromLTRB(4, 18, 0, 1),
                          enabledBorder: getBorder(
                              widget.siganExerciseState.correctSec,
                              widget.siganExerciseState.userSec),
                          focusedBorder: getBorder(
                              widget.siganExerciseState.correctSec,
                              widget.siganExerciseState.userSec),
                        ),
                        onChanged: (String? newVal) {
                          if (newVal != null) {
                            setState(() {
                              widget.onUserSecSet(
                                  widget.siganExerciseState, newVal);
                            });
                          }
                        },
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('초'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
