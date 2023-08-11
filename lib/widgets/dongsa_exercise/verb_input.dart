import 'package:flutter/material.dart';
import 'package:handrills/lang_data/dongsa.dart';
import 'package:handrills/widgets/shared/hd_free_form_entry_wrapper.dart';
import 'package:nrs_flutter_lib/widgets/n_free_form_entry.dart';

class VerbInput extends StatelessWidget {
  final Dongsa dongsa;
  final String hintValue;

  final String correctValue;
  final String activeValue;
  final Function(String) onSubmitted;
  final Function onCorrect;

  const VerbInput({
    Key? key,
    required this.dongsa,
    required this.correctValue,
    required this.activeValue,
    required this.onSubmitted,
    required this.onCorrect,
    required this.hintValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HdFreeFormEntryWrapper(
      showBoxLabel: true,
      widthType: NFreeFormWidths.half,
      hintValue: hintValue,
      onChanged: (String newValue) {
        onSubmitted(newValue);
      },
      initialValue: activeValue,
      correctValues: [correctValue],
      onCorrect: onCorrect,
    );
  }
}
