import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:handrills/widgets/shared/footer-button.dart';

class HomeButton extends StatelessWidget {
  final double width;

  const HomeButton({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FooterButton(
      width: width,
      context: context,
      icon: Icons.home,
      text: AppLocalizations.of(context)!.home,
      onPressed: () => Navigator.popUntil(
        context,
        ModalRoute.withName('/'),
      ),
    );
  }
}
