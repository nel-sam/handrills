import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';

class IconTextButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final IconData icon;
  final bool disabled;

  const IconTextButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.icon,
      this.disabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: MaterialButton(
        child: Column(
          children: [
            Icon(icon, color: disabled ? Colors.grey : ACCENT_COLOR),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: disabled ? Colors.grey : ACCENT_COLOR),
            ),
          ],
        ),
        onPressed: () => onPressed(),
      ),
    );
  }
}
