import 'package:flutter/material.dart';
import 'package:handrills/main.dart';
import 'package:handrills/widgets/menus/exercise-button.dart';
import 'package:handrills/widgets/suja-exercise/suja-exercise.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ExerciseButton(
              destination: SujaExercise(),
              imagePath: 'assets/button-bgs/city.jpg',
              label: AppLocalizations.of(context)!.numbersExercise,
            ),
            ExerciseButton(
              destination: MyHomePage(title: 'HanDrills'),
              imagePath: 'assets/button-bgs/sakura.jpg',
              label: AppLocalizations.of(context)!.coming_soon,
            )
          ],
        ),
      ],
    );
  }
}
