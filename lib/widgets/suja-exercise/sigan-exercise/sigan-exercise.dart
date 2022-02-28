import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:handrills/state/enums.dart';
import 'package:handrills/state/exercise-nav-notifier.dart';
import 'package:handrills/state/suja/sigan/sigan-notifier.dart';
import 'package:handrills/widgets/shared/ad-card.dart';
import 'package:handrills/widgets/shared/home-button-wrapper.dart';
import 'package:handrills/widgets/shared/nav-header-wrapper.dart';
import 'package:handrills/widgets/shared/question-free-form.dart';
import 'package:handrills/widgets/suja-exercise/number-chart.dart';
import 'package:handrills/widgets/suja-exercise/sigan-exercise/clock.dart';
import 'package:nrs_flutter_lib/enums.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n-answer-status-icon.dart';
import 'package:nrs_flutter_lib/widgets/n-footer-button.dart';
import 'package:nrs_flutter_lib/widgets/n-info-button.dart';
import 'package:provider/provider.dart';

class SiganExercise extends StatelessWidget {
  final double textFieldWidth = 70;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: Nrs.NrsAppBar(
            title: AppLocalizations.of(context)!.numbers, context: context),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getContent(context),
              AdCard(),
            ],
          ),
        ),
        persistentFooterButtons: [
          HomeButtonWrapper(),
          NFooterButton(
            text: AppLocalizations.of(context)!.numberChart,
            icon: Icons.list,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NumberChart()),
              );
            },
          ),
        ],
      ),
    );
  }

  getContent(BuildContext context) {
    return ChangeNotifierProvider<ExerciseNavNotifier>(
      create: (context) => ExerciseNavNotifier(ExerciseType.Sigan),
      child: Consumer<ExerciseNavNotifier>(
        builder: (context, navNotifier, child) {
          var s = navNotifier.getActive();

          return Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Column(
              children: [
                NavHeaderWrapper(navNotifier: navNotifier),
                Clock(time: '${s.hour}:${s.min}:${s.sec}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context)!.typeTheTime),
                    NInfoButton(
                      text: AppLocalizations.of(context)!.timeDesc,
                    ),
                  ],
                ),
                ChangeNotifierProvider<SiganNotifier>(
                  create: (context) => SiganNotifier(navNotifier.getActive),
                  child: Consumer<SiganNotifier>(
                    builder: (context, siganNotifier, child) {
                      var s = siganNotifier.getStateItem();
                      // TODO: Make status 3d
                      var isHourCorrect = s.correctHour == s.userHour
                          ? CorrectStatus.correct
                          : CorrectStatus.unstarted;
                      var isMinCorrect = s.correctMin == s.userMin
                          ? CorrectStatus.correct
                          : CorrectStatus.unstarted;
                      var isSecCorrect = s.correctSec == s.userSec
                          ? CorrectStatus.correct
                          : CorrectStatus.unstarted;

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              NAnswerStatusIcon(status: isHourCorrect),
                              Container(
                                width: textFieldWidth,
                                child: QuestionFreeForm(
                                  activeValue: s.userHour,
                                  hintValue: '',
                                  correctValues: [s.correctHour],
                                  onChanged: (String newVal) =>
                                      siganNotifier.updateHour(newVal),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('시'),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              NAnswerStatusIcon(status: isMinCorrect),
                              Container(
                                width: textFieldWidth,
                                child: QuestionFreeForm(
                                  activeValue: s.userMin,
                                  hintValue: '',
                                  correctValues: [s.correctMin],
                                  onChanged: (String newVal) =>
                                      siganNotifier.updateMin(newVal),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('분'),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              NAnswerStatusIcon(status: isSecCorrect),
                              Container(
                                width: textFieldWidth,
                                child: QuestionFreeForm(
                                  activeValue: s.userSec,
                                  hintValue: '',
                                  correctValues: [s.correctSec],
                                  onChanged: (String newVal) =>
                                      siganNotifier.updateSec(newVal),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('초'),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
