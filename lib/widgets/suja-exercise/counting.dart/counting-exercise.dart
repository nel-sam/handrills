import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:handrills/state/enums.dart';
import 'package:handrills/state/exercise-nav-notifier.dart';
import 'package:handrills/state/suja/count-notifier.dart';
import 'package:handrills/widgets/shared/ad-card.dart';
import 'package:handrills/widgets/shared/answer-status-button.dart';
import 'package:handrills/widgets/shared/exercise-header.dart';
import 'package:handrills/widgets/shared/footer-button.dart';
import 'package:handrills/widgets/shared/hd-text.dart';
import 'package:handrills/widgets/shared/home-button.dart';
import 'package:handrills/widgets/shared/info-button.dart';
import 'package:handrills/widgets/shared/question-free-form.dart';
import 'package:handrills/widgets/suja-exercise/number-chart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class CountingExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var footerButtonWidth = HD.getScreenWidth(context, halfWidth: true) - 20;

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
                  ExerciseHeader(
                    setPrevious: () => navNotifier.setPrevious(),
                    setNext: () => navNotifier.setNext(),
                    clear: () => navNotifier.clearInput(),
                  ),
                  Column(
                    children: [
                      Icon(navNotifier.getActive().icon, size: 90),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HDText(label, isBold: true),
                          InfoButton(text: infoText),
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
                        var isCorrect = s.getIsCorrect();

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                child: AnswerStatusButton(
                              isCorrect: isCorrect,
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
        appBar: AppBar(
          leading: Builder(builder: (BuildContext context) => BackButton()),
          elevation: APPBAR_ELEVATION,
          backgroundColor: HD.getAppBarColor(context),
          iconTheme: HD.getAppBarIconTheme(context),
          title: Text(AppLocalizations.of(context)!.numbers,
              style: HEADER_TEXT_STYLE),
        ),
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
