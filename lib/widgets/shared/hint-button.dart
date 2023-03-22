import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';

class HintButton extends StatelessWidget {
  final String text;

  const HintButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "Hint: $text",
      triggerMode: TooltipTriggerMode.tap,
      preferBelow: false,
      child: Icon(Icons.lightbulb_circle),
    );
  }
}
