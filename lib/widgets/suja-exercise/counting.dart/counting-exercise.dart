import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:handrills/state/enums.dart';
import 'package:handrills/state/exercise-nav-notifier.dart';
import 'package:handrills/state/suja/count/count-notifier.dart';
import 'package:handrills/widgets/shared/ad-card.dart';
import 'package:handrills/widgets/shared/footer-button.dart';
import 'package:handrills/widgets/shared/home-button.dart';
import 'package:handrills/widgets/shared/nav-header-wrapper.dart';
import 'package:handrills/widgets/shared/question-free-form.dart';
import 'package:handrills/widgets/suja-exercise/number-chart.dart';
import 'package:nrs_flutter_lib/enums.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n-answer-status-icon.dart';
import 'package:nrs_flutter_lib/widgets/n-info-button.dart';
import 'package:nrs_flutter_lib/widgets/n-text-span.dart';
import 'package:provider/provider.dart';

class CountingExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var footerButtonWidth = Nrs.getScreenWidth(halfWidth: true) - 20;

    getContent(BuildContext context) {
      return ChangeNotifierProvider<ExerciseNavNotifier>(
        create: (context) => ExerciseNavNotifier(ExerciseType.Count),
        child: Consumer<ExerciseNavNotifier>(
          builder: (context, navNotifier, child) {
            var activeItem = navNotifier.getActive();
            var label = activeItem.getLabel(context);

            var infoText = activeItem.isSino
                ? AppLocalizations.of(context)!.use_sino
                : AppLocalizations.of(context)!.use_native;

            infoText +=
                ' ${label.toLowerCase()}: ${activeItem.correctAnswer}${activeItem.isSino ? '' : ' '}${activeItem.counter}';

            return Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  NavHeaderWrapper(navNotifier: navNotifier),
                  Column(
                    children: [
                      Icon(navNotifier.getActive().icon, size: 90),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          NTextSpan(label,
                              textStyle: HD.fontStyleBold(context)),
                          NInfoButton(text: infoText),
                        ],
                      ),
                      Text(
                        '× ${navNotifier.getActive().count}',
                        style: TextStyle(fontSize: 40),
                      ),
                    ],
                  ),
                  ChangeNotifierProvider<CountNotifier>(
                    create: (context) => CountNotifier(navNotifier.getActive),
                    child: Consumer<CountNotifier>(
                      builder: (context, countNotifier, child) {
                        var s = countNotifier.getStateItem();
                        // TODO: Make 3d
                        var isCorrect = s.getIsCorrect()
                            ? CorrectStatus.correct
                            : CorrectStatus.unstarted;

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                child: NAnswerStatusIcon(
                              status: isCorrect,
                            )),
                            Container(
                              width: 80,
                              child: QuestionFreeForm(
                                activeValue: s.userInput,
                                hintValue: '',
                                onChanged: (String newVal) =>
                                    countNotifier.updateCount(newVal),
                                correctValues: [s.correctAnswer],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(navNotifier.getActive().counter,
                                  style: TextStyle(fontSize: 28)),
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
          HomeButton(width: footerButtonWidth),
          FooterButton(
            width: footerButtonWidth,
            context: context,
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
}
