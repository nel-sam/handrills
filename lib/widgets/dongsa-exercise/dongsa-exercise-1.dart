import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:handrills/state/dongsa/dongsa-notifier.dart';
import 'package:handrills/state/enums.dart';
import 'package:handrills/state/exercise-nav-notifier.dart';
import 'package:handrills/widgets/dongsa-exercise/verb-chart.dart';
import 'package:handrills/widgets/dongsa-exercise/verb-input.dart';
import 'package:handrills/widgets/shared/ad-card.dart';
import 'package:handrills/widgets/shared/home-button-wrapper.dart';
import 'package:handrills/widgets/shared/nav-header-wrapper.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n-footer-button.dart';
import 'package:nrs_flutter_lib/widgets/n-text-span.dart';
import 'package:provider/provider.dart';

class DongsaExerciseLevel1 extends StatelessWidget {
  const DongsaExerciseLevel1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ChangeNotifierProvider<ExerciseNavNotifier>(
        create: (context) => ExerciseNavNotifier(ExerciseType.Dongsa),
        child: Consumer<ExerciseNavNotifier>(
          builder: (context, navNotifier, child) => Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: Nrs.NrsAppBar(
                title: '${AppLocalizations.of(context)!.verbs} 1 (반말)',
                context: context),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NavHeaderWrapper(navNotifier: navNotifier),
                  Expanded(child: getExercises(context, navNotifier)),
                  AdCard(),
                ],
              ),
            ),
            persistentFooterButtons: [
              HomeButtonWrapper(),
              NFooterButton(
                text: AppLocalizations.of(context)!.verbChart,
                icon: Icons.list,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          VerbChart(dongsa: navNotifier.getActive().dongsa),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getExercises(BuildContext context, ExerciseNavNotifier navNotifier) {
    var width = Nrs.getScreenWidth(halfWidth: true) + 80;

    return Container(
      width: width,
      child: ChangeNotifierProvider<DongsaNotifier>(
        create: (context) => DongsaNotifier(navNotifier.getActive),
        child: Consumer<DongsaNotifier>(
          builder: (context, dongsaNotifier, child) {
            var dongsa = dongsaNotifier.getActive().dongsa;

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NTextSpan(
                      dongsa.infinitive,
                      textStyle: HD.fontStyleBold(context),
                      textAlign: TextAlign.end,
                    ),
                    SizedBox(width: FONT_SIZE),
                    NTextSpan(dongsa.getTranslation(context)),
                  ],
                ),
                VerbInput(
                  dongsa: dongsa,
                  activeValue: dongsaNotifier.getUserInput(0),
                  label: AppLocalizations.of(context)!.present,
                  correctValue: dongsa.banmar.present,
                  onChanged: (String newValue) =>
                      dongsaNotifier.updateUserInput(0, newValue),
                ),
                VerbInput(
                  dongsa: dongsa,
                  activeValue: dongsaNotifier.getUserInput(1),
                  label: AppLocalizations.of(context)!.past,
                  correctValue: dongsa.banmar.past,
                  onChanged: (String newValue) =>
                      dongsaNotifier.updateUserInput(1, newValue),
                ),
                VerbInput(
                  activeValue: dongsaNotifier.getUserInput(2),
                  dongsa: dongsa,
                  label: AppLocalizations.of(context)!.future,
                  correctValue: '${dongsa.banmar.futureStem} 거야',
                  onChanged: (String newValue) =>
                      dongsaNotifier.updateUserInput(2, newValue),
                ),
                VerbInput(
                  activeValue: dongsaNotifier.getUserInput(3),
                  dongsa: dongsa,
                  label: AppLocalizations.of(context)!.conditional,
                  correctValue: '${dongsa.stem}겠어',
                  onChanged: (String newValue) =>
                      dongsaNotifier.updateUserInput(3, newValue),
                ),
                VerbInput(
                  activeValue: dongsaNotifier.getUserInput(4),
                  dongsa: dongsa,
                  label: AppLocalizations.of(context)!.propositive,
                  correctValue: '${dongsa.stem}자',
                  onChanged: (String newValue) =>
                      dongsaNotifier.updateUserInput(4, newValue),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
