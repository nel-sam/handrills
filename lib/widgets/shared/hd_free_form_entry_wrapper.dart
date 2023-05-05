import 'package:flutter/material.dart';
import 'package:nrs_flutter_lib/widgets/n_free_form_entry.dart';

class HdFreeFormEntryWrapper extends StatelessWidget {
  final Function(String) onChanged;
  final Function onCorrect;

  final String initialValue;
  final List<String> correctValues;
  final NFreeFormWidths widthType;
  final String hintValue;

  HdFreeFormEntryWrapper({
    Key? key,
    required this.onChanged,
    required this.onCorrect,
    required this.initialValue,
    required this.correctValues,
    required this.widthType,
    required this.hintValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NFreeFormEntry(
      widthType: NFreeFormWidths.half,
      hintValue: hintValue,
      onChanged: (String newValue) {
        this.onChanged(newValue);
      },
      onCorrect: this.onCorrect,
      initialValue: this.initialValue,
      correctValues: this.correctValues,
    );
  }
}
