import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/hd_helpers.dart';
import 'package:handrills/state/enums.dart';
import 'package:handrills/widgets/menus/numbers_menu.dart';
import 'package:handrills/widgets/shared/home_button_wrapper.dart';
import 'package:handrills/widgets/shared/settings_screen.dart';
import 'package:nrs_flutter_lib/widgets/n_footer_button.dart';
import 'package:nrs_flutter_lib/widgets/n_footer_menu.dart';

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
          text: HD.t('numbers'),
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
          text: HD.t('verbs'),
          icon: HDIcons.verbs,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SettingsScreen(
                  exerciseType: ExerciseType.Dongsa,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
