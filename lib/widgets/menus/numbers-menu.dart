import 'package:flutter/material.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:handrills/widgets/menus/exercise-button.dart';
import 'package:handrills/widgets/shared/ad-card.dart';
import 'package:handrills/widgets/suja-exercise/age/age-exercise.dart';
import 'package:handrills/widgets/suja-exercise/counting.dart/counting-exercise.dart';
import 'package:handrills/widgets/suja-exercise/sigan-exercise/sigan-exercise.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NumbersMenu extends StatelessWidget {
  const NumbersMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: HD.HanAppBar(context, AppLocalizations.of(context)!.numbers),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  ExerciseButton(
                    destination: SiganExercise(),
                    imagePath: 'assets/button-bgs/clocks.jpg',
                    label: AppLocalizations.of(context)!.time,
                  ),
                  ExerciseButton(
                    destination: AgeExercise(),
                    imagePath: 'assets/button-bgs/old-store.jpg',
                    label: AppLocalizations.of(context)!.age,
                  ),
                  ExerciseButton(
                    destination: CountingExercise(),
                    imagePath: 'assets/button-bgs/tigers.jpg',
                    label: AppLocalizations.of(context)!.counting,
                  ),
                ],
              ),
            ),
            AdCard(),
          ],
        ),
      ),
    );
  }
}
