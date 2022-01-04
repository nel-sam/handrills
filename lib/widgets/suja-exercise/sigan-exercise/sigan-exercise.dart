import 'package:flutter/material.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:handrills/state/models/sigan-exercise-state.dart';
import 'package:handrills/widgets/shared/answer-status-button.dart';
import 'package:handrills/widgets/shared/info-button.dart';
import 'package:handrills/widgets/shared/next-button.dart';
import 'package:handrills/widgets/suja-exercise/sigan-exercise/clock.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SiganExercise extends StatefulWidget {
  final SiganExerciseState siganExerciseState;
  final Function() onNextButtonPressed;
  final Function(SiganExerciseState, String) onUserHourSet;
  final Function(SiganExerciseState, String) onUserMinSet;
  final Function(SiganExerciseState, String) onUserSecSet;

  const SiganExercise({
    Key? key,
    required this.siganExerciseState,
    required this.onNextButtonPressed,
    required this.onUserHourSet,
    required this.onUserMinSet,
    required this.onUserSecSet,
  }) : super(key: key);

  @override
  _SiganExerciseState createState() => _SiganExerciseState();
}

class _SiganExerciseState extends State<SiganExercise> {
  final double textFieldWidth = 70;
  bool showInfo = false;

  @override
  Widget build(BuildContext context) {
    var isHourCorrect = widget.siganExerciseState.correctHour ==
        widget.siganExerciseState.userHour;
    var isMinCorrect = widget.siganExerciseState.correctMin ==
        widget.siganExerciseState.userMin;
    var isSecCorrect = widget.siganExerciseState.correctSec ==
        widget.siganExerciseState.userSec;
    var s = widget.siganExerciseState;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Clock(time: '${s.hour}:${s.min}:${s.sec}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Text(AppLocalizations.of(context)!.typeTheTime),
              ),
              InfoButton(
                onPressed: () {
                  setState(() {
                    showInfo = !showInfo;
                  });
                },
              ),
            ],
          ),
          if (showInfo) Text(AppLocalizations.of(context)!.timeDesc),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  AnswerStatusButton(isCorrect: isHourCorrect),
                  Container(
                      width: textFieldWidth,
                      child: TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.fromLTRB(4, 18, 0, 1),
                          enabledBorder: HD.getTextFieldBorder(isHourCorrect),
                          focusedBorder: HD.getTextFieldBorder(isHourCorrect),
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
              Column(
                children: [
                  AnswerStatusButton(isCorrect: isMinCorrect),
                  Container(
                      width: textFieldWidth,
                      child: TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.fromLTRB(4, 18, 0, 1),
                          enabledBorder: HD.getTextFieldBorder(isMinCorrect),
                          focusedBorder: HD.getTextFieldBorder(isMinCorrect),
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
              Column(
                children: [
                  AnswerStatusButton(isCorrect: isSecCorrect),
                  Container(
                      width: textFieldWidth,
                      child: TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.fromLTRB(4, 18, 0, 1),
                          enabledBorder: HD.getTextFieldBorder(isSecCorrect),
                          focusedBorder: HD.getTextFieldBorder(isSecCorrect),
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
          NextButton(
            enabled: widget.siganExerciseState.getIsCorrect(),
            onPressed: widget.onNextButtonPressed,
          ),
        ],
      ),
    );
  }
}
