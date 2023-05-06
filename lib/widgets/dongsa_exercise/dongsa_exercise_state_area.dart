import 'package:flutter/material.dart';
import 'package:handrills/hd_helpers.dart';
import 'package:handrills/state/dongsa/dongsa_exercise_state.dart';
import 'package:handrills/widgets/dongsa_exercise/verb_input.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/widgets/n_text_span.dart';

class DongsaExerciseStateArea extends StatefulWidget {
  final DongsaExerciseState state;

  const DongsaExerciseStateArea({Key? key, required this.state})
      : super(key: key);

  @override
  State<DongsaExerciseStateArea> createState() =>
      _DongsaExerciseStateAreaState();
}

class _DongsaExerciseStateAreaState extends State<DongsaExerciseStateArea> {
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: FONT_SIZE),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NTextSpan(
                widget.state.dongsa.infinitive,
                textStyle: HD.fontStyleBold(context),
                textAlign: TextAlign.end,
              ),
              SizedBox(width: FONT_SIZE),
              NTextSpan(widget.state.dongsa.translation),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: VerbInput(
              dongsa: widget.state.dongsa,
              activeValue: widget.state.getUserInput(0),
              hintValue: HD.t('present'),
              correctValue: widget.state.dongsa.banmar.present,
              onSubmitted: (String newValue) {
                widget.state.updateUserInput(0, newValue);
              },
              onCorrect: () {
                setState(() {});
              },
            )),
        VerbInput(
          dongsa: widget.state.dongsa,
          activeValue: widget.state.getUserInput(1),
          hintValue: HD.t('past'),
          correctValue: widget.state.dongsa.banmar.past,
          onSubmitted: (String newValue) =>
              widget.state.updateUserInput(1, newValue),
          onCorrect: () {
            setState(() {});
          },
        ),
        VerbInput(
          activeValue: widget.state.getUserInput(2),
          dongsa: widget.state.dongsa,
          hintValue: HD.t('future'),
          correctValue: '${widget.state.dongsa.banmar.futureStem} 거야',
          onSubmitted: (String newValue) =>
              widget.state.updateUserInput(2, newValue),
          onCorrect: () {
            setState(() {});
          },
        ),
        VerbInput(
          activeValue: widget.state.getUserInput(4),
          dongsa: widget.state.dongsa,
          hintValue: HD.t('propositive'),
          correctValue: '${widget.state.dongsa.stem}자',
          onSubmitted: (String newValue) =>
              widget.state.updateUserInput(4, newValue),
          onCorrect: () {
            setState(() {});
          },
        ),
      ],
    );
  }
}
