import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NextButton extends StatelessWidget {
  final bool enabled;
  final Function() onPressed;

  const NextButton({
    Key? key,
    required this.enabled,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: enabled
          ? ElevatedButton(
              onPressed: onPressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.next_exercise),
                  Icon(Icons.arrow_right_outlined),
                ],
              ),
            )
          : ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('…'),
                ],
              ),
            ),
    );
  }
}
