import 'package:flutter/material.dart';
import 'package:handrills/hd-helpers.dart';

class HDText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final bool isBold;

  const HDText(
    this.text, {
    Key? key,
    this.textAlign = TextAlign.start,
    this.isBold = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
          right: 2,
          left: 2,
          bottom: 8,
          top: 8,
        ),
        child: SelectableText.rich(
          this.isBold
              ? TextSpan(text: text, style: HD.fontStyleBold())
              : TextSpan(text: text, style: HD.fontStyleNormal()),
          textAlign: textAlign,
        ),
      ),
    );
  }
}
