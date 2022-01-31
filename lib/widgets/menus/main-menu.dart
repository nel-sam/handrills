import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:handrills/widgets/dongsa-exercise/dongsa-exercise-1.dart';
import 'package:handrills/widgets/menus/exercise-button.dart';
import 'package:handrills/widgets/menus/numbers-menu.dart';
import 'package:handrills/widgets/shared/ad-card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var buttons = [
      ExerciseButton(
        destination: NumbersMenu(),
        imagePath: 'assets/button-bgs/city.jpg',
        icon: Icons.onetwothree,
        label: AppLocalizations.of(context)!.numbersExercise,
        hanLabel: '수자',
      ),
      ExerciseButton(
        destination: DongsaExerciseLevel1(),
        imagePath: 'assets/button-bgs/sakura.jpg',
        icon: Icons.nordic_walking_outlined,
        label: AppLocalizations.of(context)!.verbs,
        hanLabel: '동사',
      ),
    ];

    return Column(
      children: [
        Container(
          height: HD.getScreenHeight(context) / 3.5,
          decoration: BoxDecoration(
            image: DecorationImage(
              opacity: HD.isDarkTheme(context) ? 0.7 : 0.9,
              image: AssetImage('assets/banners/stairs.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: FONT_SIZE, left: FONT_SIZE),
            child: Row(
              children: [
                Text(
                  APP_NAME,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: buttons,
          ),
        ),
        AdCard(),
      ],
    );
  }
}
