import 'package:flutter/material.dart';
import 'package:handrills/hd_helpers.dart';
import 'package:handrills/state/susja/sigan/sigan_exercise_state.dart';
import 'package:handrills/widgets/shared/hd_free_form_entry_wrapper.dart';
import 'package:nrs_flutter_lib/widgets/n_free_form_entry.dart';

class SiganExerciseStateArea extends StatefulWidget {
  final SiganExerciseState state;
  const SiganExerciseStateArea({required this.state, Key? key})
      : super(key: key);

  @override
  State<SiganExerciseStateArea> createState() => _SiganExerciseStateAreaState();
}

class _SiganExerciseStateAreaState extends State<SiganExerciseStateArea> {
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HdFreeFormEntryWrapper(
          showBoxLabel: true,
          widthType: NFreeFormWidths.full,
          hintValue: HD.t('hour'),
          onCorrect: () {
            setState(() {});
          },
          onChanged: (String newValue) => widget.state.updateHour(newValue),
          initialValue: widget.state.userHour,
          correctValues: widget.state.correctHours,
        ),
        HdFreeFormEntryWrapper(
          showBoxLabel: true,
          widthType: NFreeFormWidths.full,
          hintValue: HD.t('minute'),
          onChanged: (String newValue) => widget.state.updateMin(newValue),
          initialValue: widget.state.userMin,
          correctValues: widget.state.correctMins,
          onCorrect: () {
            setState(() {});
          },
        ),
        HdFreeFormEntryWrapper(
          showBoxLabel: true,
          widthType: NFreeFormWidths.full,
          hintValue: HD.t('second'),
          onChanged: (String newValue) => widget.state.updateSec(newValue),
          initialValue: widget.state.userSec,
          correctValues: widget.state.correctSecs,
          onCorrect: () {
            setState(() {});
          },
        )
      ],
    );
  }
}
