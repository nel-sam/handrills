import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';

class InfoButton extends StatelessWidget {
  final String text;
  const InfoButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.info),
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Icon(Icons.info),
            content: Text(text),
            actions: [
              OutlinedButton(
                child: Icon(Icons.check, color: ACCENT_COLOR),
                onPressed: () => Navigator.pop(context, 'OK'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
