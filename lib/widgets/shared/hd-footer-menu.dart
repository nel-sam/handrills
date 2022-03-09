import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/widgets/dongsa-exercise/dongsa-exercise-1.dart';
import 'package:handrills/widgets/menus/numbers-menu.dart';
import 'package:handrills/widgets/shared/home-button-wrapper.dart';
import 'package:nrs_flutter_lib/widgets/n-footer-button.dart';
import 'package:nrs_flutter_lib/widgets/n-footer-menu.dart';

class HDMenuFooter extends StatelessWidget {
  final int activeIndex;

  const HDMenuFooter({
    Key? key,
    required this.activeIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NFooterMenu(
      buttons: [
        HomeButtonWrapper(),
        NFooterButton(
          text: AppLocalizations.of(context)!.numbers,
          icon: HDIcons.numbers,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NumbersMenu(),
              ),
            );
          },
        ),
        NFooterButton(
          text: AppLocalizations.of(context)!.verbs,
          icon: HDIcons.verbs,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DongsaExerciseLevel1(),
              ),
            );
          },
        ),
      ],
    );
  }
}
