import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:handrills/widgets/menus/exercise-button.dart';
import 'package:handrills/widgets/shared/ad-card.dart';
import 'package:handrills/widgets/suja-exercise/age/age-exercise.dart';
import 'package:handrills/widgets/suja-exercise/counting.dart/counting-exercise.dart';
import 'package:handrills/widgets/suja-exercise/sigan-exercise/sigan-exercise.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';

class NumbersMenu extends StatelessWidget {
  const NumbersMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Nrs.NrsAppBar(
          title: AppLocalizations.of(context)!.numbers, context: context),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  ExerciseButton(
                    halfWidth: true,
                    destination: SiganExercise(),
                    icon: Icons.timer_outlined,
                    label: AppLocalizations.of(context)!.time,
                    hanLabel: '시간',
                  ),
                  ExerciseButton(
                    halfWidth: true,
                    destination: AgeExercise(),
                    icon: Icons.elderly_outlined,
                    label: AppLocalizations.of(context)!.age,
                    hanLabel: '나이',
                  ),
                  ExerciseButton(
                    halfWidth: true,
                    destination: CountingExercise(),
                    icon: Icons.widgets_outlined,
                    label: AppLocalizations.of(context)!.counting,
                    hanLabel: '계산',
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
