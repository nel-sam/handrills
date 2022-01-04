import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';

// ignore: non_constant_identifier_names
Widget FooterButton({
  required BuildContext context,
  required String text,
  required Function onPressed,
  required IconData icon,
  required double width,
  bool disabled = false,
}) =>
    Container(
      width: width,
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
