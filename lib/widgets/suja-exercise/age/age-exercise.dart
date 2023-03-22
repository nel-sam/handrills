import 'package:flutter/material.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:handrills/state/enums.dart';
import 'package:handrills/state/exercise-nav-notifier.dart';
import 'package:handrills/state/suja/age/age-notifier.dart';
import 'package:handrills/widgets/shared/ad-card.dart';
import 'package:handrills/widgets/shared/hint-button.dart';
import 'package:handrills/widgets/shared/home-button-wrapper.dart';
import 'package:handrills/widgets/shared/nav-header-wrapper.dart';
import 'package:handrills/widgets/shared/question-free-form.dart';
import 'package:handrills/widgets/suja-exercise/number-chart.dart';
import 'package:nrs_flutter_lib/enums.dart';
import 'package:nrs_flutter_lib/nrs_flutter_lib.dart';
import 'package:nrs_flutter_lib/widgets/n_answer_status_icon.dart';
import 'package:nrs_flutter_lib/widgets/n_footer_button.dart';
import 'package:nrs_flutter_lib/widgets/n_footer_menu.dart';
import 'package:provider/provider.dart';

class AgeExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget getContent(BuildContext context) {
      return ChangeNotifierProvider<ExerciseNavNotifier>(
        create: (context) => ExerciseNavNotifier(ExerciseType.Age),
        child: Consumer<ExerciseNavNotifier>(
          builder: (context, navNotifier, child) {
            var s = navNotifier.getActive();

            return Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  NavHeaderWrapper(navNotifier: navNotifier),
                  Text('몇 살이에요?', style: TextStyle(fontSize: 20)),
                  Text(s.age.toString(), style: TextStyle(fontSize: 24)),
                  ChangeNotifierProvider<AgeNotifier>(
                    create: (context) => AgeNotifier(navNotifier.getActive),
                    child: Consumer<AgeNotifier>(
                      builder: (context, ageNotifier, child) {
                        var s = ageNotifier.getStateItem();
                        var hintText = '';

                        if (s.userInput == '') {
                          hintText = s.correctAnswer[0];
                        } else if (s.userInput == s.correctAnswer) {
                          hintText = 'Good job!';
                        } else {
                          for (var i = 0;
                              i < s.correctAnswer.length &&
                                  i < s.userInput.length;
                              i++) {
                            if (s.correctAnswer[i] == s.userInput[i] &&
                                i < s.correctAnswer.length - 1) {
                              hintText = s.correctAnswer[i + 1];
                            } else
                              hintText = s.correctAnswer[i];
                          }
                        }

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // TODO: Make 3d
                            NAnswerStatusIcon(
                                status: s.getIsCorrect()
                                    ? CorrectStatus.correct
                                    : CorrectStatus.unstarted),
                            s.correctAnswer.length != s.userInput.length
                                ? HintButton(text: hintText)
                                : Container(),
                            Container(
                              width: 150,
                              child: QuestionFreeForm(
                                activeValue: s.userInput,
                                correctValues: [s.correctAnswer],
                                hintValue: '',
                                onChanged: (String newVal) =>
                                    ageNotifier.updateAge(newVal),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('살', style: TextStyle(fontSize: 28)),
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
        appBar: Nrs.NrsAppBar(title: HD.t('numbers'), context: context),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getContent(context),
              //    AdCard(),
            ],
          ),
        ),
        persistentFooterButtons: [
          NFooterMenu(buttons: [
            HomeButtonWrapper(),
            NFooterButton(
              text: HD.t('numberChart'),
              icon: Icons.list,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NumberChart()),
                );
              },
            ),
          ])
        ],
      ),
    );
  }
}
