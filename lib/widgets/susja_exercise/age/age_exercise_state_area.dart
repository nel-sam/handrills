import 'package:flutter/material.dart';
import 'package:handrills/state/susja/age/age_exercise_state.dart';
import 'package:handrills/widgets/shared/hd_free_form_entry_wrapper.dart';
import 'package:nrs_flutter_lib/widgets/n_free_form_entry.dart';

class AgeExerciseStateArea extends StatefulWidget {
  final AgeExerciseState state;

  const AgeExerciseStateArea({Key? key, required this.state}) : super(key: key);

  @override
  State<AgeExerciseStateArea> createState() => _AgeExerciseStateAreaState();
}

class _AgeExerciseStateAreaState extends State<AgeExerciseStateArea> {
  @override
  Widget build(BuildContext context) {
    return HdFreeFormEntryWrapper(
      widthType: NFreeFormWidths.half,
      onChanged: (String newValue) {
        widget.state.updateAge(newValue);
      },
      initialValue: widget.state.userInput,
      correctValues: widget.state.correctAnswers,
      onCorrect: () {
        setState(() {});
      },
    );
  }
}
