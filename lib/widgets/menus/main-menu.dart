import 'package:flutter/material.dart';
import 'package:handrills/widgets/dongsa-exercise/dongsa-exercise-1.dart';
import 'package:handrills/widgets/menus/exercise-button.dart';
import 'package:handrills/widgets/menus/numbers-menu.dart';
import 'package:handrills/widgets/shared/ad-card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              ExerciseButton(
                destination: NumbersMenu(),
                imagePath: 'assets/button-bgs/city.jpg',
                label: AppLocalizations.of(context)!.numbersExercise,
              ),
              ExerciseButton(
                destination: DongsaExerciseLevel1(),
                imagePath: 'assets/button-bgs/sakura.jpg',
                label: AppLocalizations.of(context)!.verbs,
              )
            ],
          ),
        ),
        AdCard(),
      ],
    );
  }
}
