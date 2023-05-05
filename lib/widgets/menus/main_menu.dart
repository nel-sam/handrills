import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/hd_helpers.dart';
import 'package:handrills/widgets/dongsa_exercise/dongsa_exercise_1.dart';
import 'package:handrills/widgets/menus/numbers_menu.dart';
import 'package:nrs_flutter_lib/constants.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n_menu_button.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Nrs.getScreenHeight() / 3.5,
          decoration: BoxDecoration(
            image: DecorationImage(
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
            children: [
              NMenuButton(
                destination: NumbersMenu(),
                label: HD.t('numbersExercise'),
                transLabel: '수자',
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
