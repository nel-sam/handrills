import 'package:flutter/material.dart';
import 'package:handrills/hd_helpers.dart';
import 'package:handrills/state/suja/count/count_exercise_state.dart';
import 'package:handrills/widgets/shared/hd_free_form_entry_wrapper.dart';
import 'package:nrs_flutter_lib/widgets/n_free_form_entry.dart';


class CountingExerciseStateArea extends StatefulWidget {
  final CountExerciseState state;
  const CountingExerciseStateArea({required this.state, Key? key})
      : super(key: key);

  @override
  State<CountingExerciseStateArea> createState() =>
      _CountingExerciseStateAreaState();
}

class _CountingExerciseStateAreaState extends State<CountingExerciseStateArea> {
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: HdFreeFormEntryWrapper(
        widthType: NFreeFormWidths.half,
        hintValue: HD.t('counter'),
        onChanged: (String newValue) => widget.state.updateCount(newValue),
        initialValue: widget.state.userInput,
        correctValues: widget.state.correctAnswers,
        onCorrect: () {
          setState(() {});
        },
      ),
    );
  }
}
