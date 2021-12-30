import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';

class HdSubHeader extends StatelessWidget {
  final String text;

  const HdSubHeader(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      color: ACCENT_COLOR,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
    );

    return Padding(
      padding: EdgeInsets.all(12),
      child: Text(this.text, style: textStyle),
    );
  }
}
