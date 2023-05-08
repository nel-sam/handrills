import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/hd_helpers.dart';
import 'package:handrills/widgets/dongsa_exercise/dongsa_exercise_1.dart';
import 'package:handrills/widgets/menus/numbers_menu.dart';
import 'package:nrs_flutter_lib/widgets/n_hero_banner.dart';
import 'package:nrs_flutter_lib/widgets/n_menu_button.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NHeroBanner(
          imagePath: 'assets/banners/stairs.jpg',
          appName: APP_NAME,
        ),
        Expanded(
          child: Column(
            children: [
              NMenuButton(
                destination: NumbersMenu(),
                label: HD.t('numbersExercise'),
                transLabel: '숫자',
              ),
              NMenuButton(
                destination: DongsaExerciseLevel1(),
                label: HD.t('verbs'),
                transLabel: '동사',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
