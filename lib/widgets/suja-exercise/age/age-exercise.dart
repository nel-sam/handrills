import 'package:flutter/material.dart';
import 'package:handrills/constants.dart';
import 'package:handrills/hd-helpers.dart';
import 'package:handrills/state/suja/age/age-notifier.dart';
import 'package:handrills/widgets/shared/ad-card.dart';
import 'package:handrills/widgets/shared/answer-status-button.dart';
import 'package:handrills/widgets/shared/exercise-header.dart';
import 'package:handrills/widgets/shared/footer-button.dart';
import 'package:handrills/widgets/shared/home-button.dart';
import 'package:handrills/widgets/shared/question-free-form.dart';
import 'package:handrills/widgets/suja-exercise/number-chart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class AgeExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var footerButtonWidth = (screenSize.width / 2) - 20;

    Widget getContent(AgeNotifier ageNotifier) {
      var s = ageNotifier.getActive();
      var isCorrect = s.getIsCorrect();

      return Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            ExerciseHeader(
              setPrevious: ageNotifier.setPrevious,
              setNext: ageNotifier.setNext,
              clear: ageNotifier.clearInput,
            ),
            Text('몇 살이에요?', style: TextStyle(fontSize: 20)),
            Text(s.age.toString(), style: TextStyle(fontSize: 24)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnswerStatusButton(isCorrect: isCorrect),
                Container(
                  width: 150,
                  child: QuestionFreeForm(
                    activeValue: s.userInput,
                    correctValues: [s.correctAnswer],
                    hintValue: '',
                    onChanged: (String newVal) => ageNotifier.updateAge(newVal),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('살', style: TextStyle(fontSize: 28)),
                ),
              ],
            ),
          ],
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
        body: ChangeNotifierProvider<AgeNotifier>(
          create: (context) => AgeNotifier(),
          child: Consumer<AgeNotifier>(
            builder: (context, model, child) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getContent(model),
                  AdCard(),
                ],
              ),
            ),
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
